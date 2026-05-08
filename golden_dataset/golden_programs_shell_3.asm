; DESCRIPTION: This GeOS assembly code implements an interactive command shell with built-in commands like help, echo, ls, cat, ps, kill, export, clear, rm, and cp. It supports external program execution via EXEC, pipe operations (cmd1 | cmd2), output redirection (cmd > file), input redirection (cmd < file), and maintains a prompt display.

; shell.asm -- Phase 29: Interactive command shell for Geometry OS
;
; A minimal command shell that provides:
; - Command prompt display
; - Built-in commands: help, echo, ls, cat, ps, kill, export, clear, rm, cp
; - External program execution via EXEC
; - Pipe operator (cmd1 | cmd2)
; - Output redirection (cmd > file, cmd >> file)
; - Input redirection (cmd < file)
;
; Memory layout:
;   0x0200 - 0x03FF: command input buffer (256 bytes)
;   0x0400 - 0x05FF: parsed command name (256 bytes)
;   0x0600 - 0x07FF: parsed argument (256 bytes)
;   0x0800 - 0x0FFF: file listing buffer (LS output)
;   0x1000 - 0x10FF: read buffer for cat
;   0x1100 - 0x11FF: working directory / env var buffer
;   0x1200:         readln position counter
;   0x1201:         prompt y position
;   0x1202:         child PID storage
;   0x1203:         pipe read fd
;   0x1204:         pipe write fd
;   0x1205:         redirect mode (0=none, 1=>, 2=>>, 3=<)
;   0x1206:         redirect fd
;   0x1207:         pipe mode flag (0=no pipe, 1=pipe)
;   0x1300 - 0x13FF: help text buffer
;   0x1400 - 0x14FF: pipe command buffer (second command in pipeline)
;   0x1500 - 0x15FF: status message buffer

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Initialize shell
; ═══════════════════════════════════════════════════════════════
    LDI r14, 0
    FILL r14               ; clear screen to black
    LDI r0, 0x1201
    LDI r14, 20
    STORE r0, r14          ; prompt y starts at line 20
    LDI r0, 0x1207
    LDI r14, 0
    STORE r0, r14          ; pipe mode = 0
    LDI r0, 0x1205
    STORE r0, r14          ; redirect mode = 0

    ; Write help text to buffer at 0x1300
    LDI r0, 0x1300
    LDI r14, 104       ; h
    STORE r0, r14
    LDI r0, 0x1301
    LDI r14, 101       ; e
    STORE r0, r14
    LDI r0, 0x1302
    LDI r14, 108       ; l
    STORE r0, r14
    LDI r0, 0x1303
    LDI r14, 112       ; p
    STORE r0, r14
    LDI r0, 0x1304
    LDI r14, 0
    STORE r0, r14

; ═══════════════════════════════════════════════════════════════
; Main loop: display prompt, read command, execute
; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Display prompt "> " at current y position
    LDI r0, 0x1201         ; r0 = prompt y addr
    LOAD r1, r0            ; r1 = y position
    LDI r9, 2              ; x = 2
    LDI r4, prompt_str
    TEXT r9, r1, r4

    ; Read a line of input
    LDI r14, 0x0200         ; buf addr
    LDI r1, 200            ; max len
    LDI r9, 0x1200         ; pos addr
    LDI r0, 0x1200
    LDI r4, 0
    STORE r0, r4           ; reset position

readln_loop:
    READLN r14, r1, r9
    CMP r14, r4             ; r14 == 0 means still reading
    JZ r14, readln_loop

    ; r14 > 0 means line complete (Enter pressed)
    ; Check if line is empty
    JZ r14, main_loop       ; empty line, loop

    ; Parse and execute the command
    CALL parse_command
    CALL execute_command

    ; Scroll down prompt position
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1

    ; If y > 240, scroll screen and reset
    LDI r14, 240
    CMP r1, r14
    BLT r1, main_loop
    LDI r14, 10
    SCROLL r14
    LDI r1, 20
    STORE r0, r1
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_command -- extract command name and argument from input
; Input: command buffer at 0x0200
; Output: command at 0x0400, argument at 0x0600
; Also sets pipe mode (0x1207) and redirect mode (0x1205)
; ═══════════════════════════════════════════════════════════════
parse_command:
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12

    ; Reset pipe mode and redirect mode
    LDI r0, 0x1207
    LDI r14, 0
    STORE r0, r14
    LDI r0, 0x1205
    STORE r0, r14

    ; Skip leading spaces
    LDI r8, 0x0200       ; src pointer
skip_spaces:
    LOAD r14, r8
    JZ r14, parse_done      ; empty string
    LDI r1, 32
    CMP r14, r1
    JZ r14, skip_spaces     ; skip space

    ; Copy command name until space or null
    LDI r11, 0x0400       ; dest for command name
copy_cmd:
    LOAD r14, r8
    JZ r14, parse_cmd_done
    LDI r1, 32
    CMP r14, r1
    JZ r14, parse_cmd_done
    ; Check for pipe character '|' (124)
    LDI r1, 124
    CMP r14, r1
    JZ r14, parse_pipe_found
    ; Check for '>' (62)
    LDI r1, 62
    CMP r14, r1
    JZ r14, parse_redirect_out
    ; Check for '<' (60)
    LDI r1, 60
    CMP r14, r1
    JZ r14, parse_redirect_in
    STORE r11, r14
    ADD r8, r4            ; r4 is still 0 from earlier... let's use r1
    ; Actually need to increment properly
    LDI r1, 1
    ADD r8, r1
    LDI r1, 1
    ADD r11, r1
    JMP copy_cmd

parse_cmd_done:
    ; Null terminate command
    LDI r14, 0
    STORE r11, r14

    ; Skip spaces after command
    LOAD r14, r8
    JZ r14, parse_arg_done  ; no argument
skip_arg_spaces:
    LOAD r14, r8
    LDI r1, 32
    CMP r14, r1
    JZ r14, skip_arg_spaces_inc
    JMP copy_arg_start
skip_arg_spaces_inc:
    LDI r1, 1
    ADD r8, r1
    JMP skip_arg_spaces

copy_arg_start:
    ; Copy argument until null
    LDI r11, 0x0600       ; dest for argument
copy_arg:
    LOAD r14, r8
    JZ r14, parse_arg_done
    ; Check for pipe
    LDI r1, 124
    CMP r14, r1
    JZ r14, parse_pipe_found_arg
    ; Check for redirect
    LDI r1, 62
    CMP r14, r1
    JZ r14, parse_redirect_out_arg
    LDI r1, 60
    CMP r14, r1
    JZ r14, parse_redirect_in_arg
    STORE r11, r14
    LDI r1, 1
    ADD r8, r1
    ADD r11, r1
    JMP copy_arg

parse_arg_done:
    LDI r14, 0
    STORE r11, r14
    JMP parse_done

parse_pipe_found:
    ; Null terminate command
    LDI r14, 0
    STORE r11, r14
    ; Set pipe mode
    LDI r0, 0x1207
    LDI r14, 1
    STORE r0, r14
    ; Skip pipe char and spaces
    LDI r1, 1
    ADD r8, r1
skip_pipe_spaces:
    LOAD r14, r8
    LDI r1, 32
    CMP r14, r1
    JZ r14, skip_pipe_spaces_inc
    JMP copy_pipe_cmd
skip_pipe_spaces_inc:
    LDI r1, 1
    ADD r8, r1
    JMP skip_pipe_spaces

copy_pipe_cmd:
    ; Copy second command to pipe buffer at 0x1400
    LDI r11, 0x1400
copy_pipe_loop:
    LOAD r14, r8
    JZ r14, parse_pipe_done
    STORE r11, r14
    LDI r1, 1
    ADD r8, r1
    ADD r11, r1
    JMP copy_pipe_loop
parse_pipe_done:
    LDI r14, 0
    STORE r11, r14
    JMP parse_done

parse_pipe_found_arg:
    ; Null terminate argument
    LDI r14, 0
    STORE r11, r14
    ; Set pipe mode
    LDI r0, 0x1207
    LDI r14, 1
    STORE r0, r14
    ; Skip pipe char and spaces
    LDI r1, 1
    ADD r8, r1
skip_pipe_spaces2:
    LOAD r14, r8
    LDI r1, 32
    CMP r14, r1
    JZ r14, skip_pipe_spaces2_inc
    JMP copy_pipe_cmd2
skip_pipe_spaces2_inc:
    LDI r1, 1
    ADD r8, r1
    JMP skip_pipe_spaces2

copy_pipe_cmd2:
    LDI r11, 0x1400
copy_pipe_loop2:
    LOAD r14, r8
    JZ r14, parse_done2
    STORE r11, r14
    LDI r1, 1
    ADD r8, r1
    ADD r11, r1
    JMP copy_pipe_loop2
parse_done2:
    LDI r14, 0
    STORE r11, r14
    JMP parse_done

parse_redirect_out:
    ; Null terminate command
    LDI r14, 0
    STORE r11, r14
    ; Check for >> (append)
    LDI r1, 1
    ADD r8, r1
    LOAD r14, r8
    LDI r1, 62
    CMP r14, r1
    JZ r14, redirect_append
    ; Single > = write (mode 1)
    LDI r0, 0x1205
    LDI r14, 1
    STORE r0, r14
    JMP skip_redir_spaces
redirect_append:
    LDI r0, 0x1205
    LDI r14, 2
    STORE r0, r14
    LDI r1, 1
    ADD r8, r1
    JMP skip_redir_spaces

parse_redirect_out_arg:
    ; Null terminate argument
    LDI r14, 0
    STORE r11, r14
    LDI r1, 1
    ADD r8, r1
    LOAD r14, r8
    LDI r1, 62
    CMP r14, r1
    JZ r14, redirect_append2
    LDI r0, 0x1205
    LDI r14, 1
    STORE r0, r14
    JMP skip_redir_spaces
redirect_append2:
    LDI r0, 0x1205
    LDI r14, 2
    STORE r0, r14
    LDI r1, 1
    ADD r8, r1
    JMP skip_redir_spaces

parse_redirect_in:
    LDI r14, 0
    STORE r11, r14
    LDI r0, 0x1205
    LDI r14, 3
    STORE r0, r14
    LDI r1, 1
    ADD r8, r1
    JMP skip_redir_spaces

parse_redirect_in_arg:
    LDI r14, 0
    STORE r11, r14
    LDI r0, 0x1205
    LDI r14, 3
    STORE r0, r14
    LDI r1, 1
    ADD r8, r1
    JMP skip_redir_spaces

skip_redir_spaces:
    LOAD r14, r8
    LDI r1, 32
    CMP r14, r1
    JZ r14, skip_redir_spaces_inc
    JMP copy_redir_file
skip_redir_spaces_inc:
    LDI r1, 1
    ADD r8, r1
    JMP skip_redir_spaces

copy_redir_file:
    ; Copy redirect filename to argument buffer (0x0600)
    LDI r11, 0x0600
copy_redir_loop:
    LOAD r14, r8
    JZ r14, parse_done
    STORE r11, r14
    LDI r1, 1
    ADD r8, r1
    ADD r11, r1
    JMP copy_redir_loop

parse_done:
    POP r12
    POP r6
    POP r11
    POP r8
    RET

; ═══════════════════════════════════════════════════════════════
; execute_command -- dispatch to built-in or EXEC
; Command at 0x0400, argument at 0x0600
; ═══════════════════════════════════════════════════════════════
execute_command:
    PUSH r8
    PUSH r11
    PUSH r6

    ; Check for empty command
    LDI r0, 0x0400
    LOAD r14, r0
    JZ r14, exec_done

    ; Compare command with known built-ins
    ; help
    CALL cmd_is_help
    JNZ r14, do_help

    ; echo
    CALL cmd_is_echo
    JNZ r14, do_echo

    ; ls
    CALL cmd_is_ls
    JNZ r14, do_ls

    ; cat
    CALL cmd_is_cat
    JNZ r14, do_cat

    ; ps
    CALL cmd_is_ps
    JNZ r14, do_ps

    ; kill
    CALL cmd_is_kill
    JNZ r14, do_kill

    ; export
    CALL cmd_is_export
    JNZ r14, do_export

    ; clear
    CALL cmd_is_clear
    JNZ r14, do_clear

    ; rm
    CALL cmd_is_rm
    JNZ r14, do_rm

    ; cp
    CALL cmd_is_cp
    JNZ r14, do_cp

    ; hypervisor
    CALL cmd_is_hypervisor
    JNZ r14, do_hypervisor

    ; edit
    CALL cmd_is_edit
    JNZ r14, do_edit

    ; save
    CALL cmd_is_save
    JNZ r14, do_save

    ; grep
    CALL cmd_is_grep
    JNZ r14, do_grep

    ; head
    CALL cmd_is_head
    JNZ r14, do_head

    ; tail
    CALL cmd_is_tail
    JNZ r14, do_tail

    ; wc
    CALL cmd_is_wc
    JNZ r14, do_wc

    ; date
    CALL cmd_is_date
    JNZ r14, do_date

    ; Not a built-in -- try EXEC
    JMP do_exec

exec_done:
    POP r6
    POP r11
    POP r8
    RET

; ── Command comparison helpers ────────────────────────────────
; Each sets r14=1 if match, r14=0 if not

cmd_is_help:
    LDI r0, 0x0400
    LDI r14, 104       ; h
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cmd_help_n
    LDI r0, 0x0401
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cmd_help_n
    LDI r0, 0x0402
    LDI r14, 108       ; l
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cmd_help_n
    LDI r0, 0x0403
    LDI r14, 112       ; p
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cmd_help_n
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cmd_help_n
    LDI r14, 1
    RET
cmd_help_n:
    LDI r14, 0
    RET

cmd_is_echo:
    LDI r0, 0x0400
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 99        ; c
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 104       ; h
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 111       ; o
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_ls:
    LDI r0, 0x0400
    LDI r14, 108       ; l
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 115       ; s
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_cat:
    LDI r0, 0x0400
    LDI r14, 99        ; c
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 97        ; a
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 116       ; t
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_ps:
    LDI r0, 0x0400
    LDI r14, 112       ; p
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 115       ; s
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_kill:
    LDI r0, 0x0400
    LDI r14, 107       ; k
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 105       ; i
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 108       ; l
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 108       ; l
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_export:
    LDI r0, 0x0400
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 120       ; x
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 112       ; p
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 111       ; o
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 114       ; r
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0405
    LDI r14, 116       ; t
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0406
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_clear:
    LDI r0, 0x0400
    LDI r14, 99        ; c
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 108       ; l
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 97        ; a
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 114       ; r
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0405
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_rm:
    LDI r0, 0x0400
    LDI r14, 114       ; r
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 109       ; m
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_cp:
    LDI r0, 0x0400
    LDI r14, 99        ; c
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 112       ; p
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_hypervisor:
    LDI r0, 0x0400
    LDI r14, 104       ; h
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 121       ; y
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 112       ; p
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 114       ; r
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0405
    LDI r14, 118       ; v
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0406
    LDI r14, 105       ; i
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0407
    LDI r14, 115       ; s
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0408
    LDI r14, 111       ; o
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0409
    LDI r14, 114       ; r
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x040A
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_edit:
    LDI r0, 0x0400
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 100       ; d
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 105       ; i
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 116       ; t
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_save:
    LDI r0, 0x0400
    LDI r14, 115       ; s
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 97        ; a
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 118       ; v
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_grep:
    LDI r0, 0x0400
    LDI r14, 103       ; g
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 114       ; r
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 112       ; p
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_head:
    LDI r0, 0x0400
    LDI r14, 104       ; h
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 97        ; a
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 100       ; d
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_tail:
    LDI r0, 0x0400
    LDI r14, 116       ; t
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 97        ; a
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 105       ; i
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 108       ; l
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_wc:
    LDI r0, 0x0400
    LDI r14, 119       ; w
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 99        ; c
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cmd_is_date:
    LDI r0, 0x0400
    LDI r14, 100       ; d
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0401
    LDI r14, 97        ; a
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0402
    LDI r14, 116       ; t
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0403
    LDI r14, 101       ; e
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r0, 0x0404
    LDI r14, 0
    LOAD r1, r0
    CMP r14, r1
    JNZ r14, cno
    LDI r14, 1
    RET

cno:
    LDI r14, 0
    RET

; ── Built-in command implementations ──────────────────────────

do_help:
    ; Display available commands
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r9, 2
    LDI r4, help_text
    TEXT r9, r1, r4
    JMP exec_done

do_echo:
    ; Print the argument
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x0600
    TEXT r9, r1, r4
    JMP exec_done

do_ls:
    ; List files using LS opcode
    LDI r1, 0x0800
    LS r1                  ; list files into buffer at 0x0800
    ; r14 = number of files
    ; Display each filename
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x0800
    TEXT r9, r1, r4
    JMP exec_done

do_cat:
    ; Read and display a file
    ; Argument (filename) at 0x0600
    LDI r1, 0x0600       ; filename addr
    LDI r9, 0            ; mode = read
    OPEN r1, r9           ; r14 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, exec_done      ; error, skip

    MOV r10, r14            ; save fd in r10
    LDI r4, 0x1000        ; read buffer
    LDI r7, 200           ; max bytes
    READ r10, r4, r7       ; r14 = bytes read
    ; Null terminate
    LDI r5, 200
    CMP r14, r5
    BLT r14, cat_term_ok
    LDI r14, 200
cat_term_ok:
    LDI r5, 0x1000
    ADD r14, r5
    LDI r13, 0
    STORE r14, r13
    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x1000
    TEXT r9, r1, r4
    CLOSE r10
    JMP exec_done

do_ps:
    ; Display process info
    ; For now, show PID count and current PID
    GETPID
    MOV r10, r14            ; save our PID
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    ; Show "PID: N" using register value
    ; Write PID as text at 0x1500
    LDI r0, 0x1500
    LDI r14, 80            ; P
    STORE r0, r14
    LDI r0, 0x1501
    LDI r14, 73            ; I
    STORE r0, r14
    LDI r0, 0x1502
    LDI r14, 68            ; D
    STORE r0, r14
    LDI r0, 0x1503
    LDI r14, 58            ; :
    STORE r0, r14
    LDI r0, 0x1504
    LDI r14, 32            ; space
    STORE r0, r14
    ; Convert PID to decimal digits
    LDI r0, 0x1505
    LDI r1, 48            ; '0'
    ADD r14, r1
    STORE r0, r14
    LDI r0, 0x1506
    LDI r14, 0
    STORE r0, r14
    LDI r9, 4
    LDI r4, 0x1500
    TEXT r9, r1, r4
    JMP exec_done

do_kill:
    ; Kill a process by PID
    ; Argument should be a number -- simplified: just echo "kill"
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r4, kill_msg
    LDI r9, 4
    TEXT r9, r1, r4
    JMP exec_done

do_export:
    ; Set environment variable
    ; Argument format: KEY=VALUE
    ; For simplicity, just acknowledge
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r4, export_msg
    LDI r9, 4
    TEXT r9, r1, r4
    JMP exec_done

do_clear:
    LDI r14, 0
    FILL r14
    LDI r0, 0x1201
    LDI r14, 20
    STORE r0, r14
    JMP exec_done

do_rm:
    ; Delete a file: rm <filename>
    ; Argument (filename) at 0x0600
    LDI r0, 0x0600
    LOAD r14, r0
    JZ r14, rm_usage
    ; Copy arg to a clean buffer at 0x1600
    LDI r6, 0x0600
    LDI r11, 0x1600
rm_copy:
    LOAD r14, r6
    JZ r14, rm_copy_done
    STORE r11, r14
    LDI r14, 1
    ADD r6, r14
    ADD r11, r14
    JMP rm_copy
rm_copy_done:
    LDI r14, 0
    STORE r11, r14      ; null terminate
    ; UNLINK r1 where r1 = 0x1600
    LDI r1, 0x1600
    UNLINK r1
    ; r14 = 0 on success, 0xFFFFFFFF on error
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JNZ r14, rm_ok
    ; Print error
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r9, 8          ; "rm: error"
    LDI r4, 0x1700
    ; Store "rm: error" message
    LDI r0, 0x1700
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1701
    LDI r14, 109        ; m
    STORE r0, r14
    LDI r0, 0x1702
    LDI r14, 58         ; :
    STORE r0, r14
    LDI r0, 0x1703
    LDI r14, 32         ; space
    STORE r0, r14
    LDI r0, 0x1704
    LDI r14, 101        ; e
    STORE r0, r14
    LDI r0, 0x1705
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1706
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1707
    LDI r14, 111        ; o
    STORE r0, r14
    LDI r0, 0x1708
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1709
    LDI r14, 0
    STORE r0, r14
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r9, 9
    LDI r4, 0x1700
    TEXT r9, r1, r4
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    JMP exec_done
rm_ok:
    JMP exec_done
rm_usage:
    ; Print "rm <file>"
    LDI r0, 0x1700
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1701
    LDI r14, 109        ; m
    STORE r0, r14
    LDI r0, 0x1702
    LDI r14, 32         ; space
    STORE r0, r14
    LDI r0, 0x1703
    LDI r14, 60         ; <
    STORE r0, r14
    LDI r0, 0x1704
    LDI r14, 102        ; f
    STORE r0, r14
    LDI r0, 0x1705
    LDI r14, 105        ; i
    STORE r0, r14
    LDI r0, 0x1706
    LDI r14, 108        ; l
    STORE r0, r14
    LDI r0, 0x1707
    LDI r14, 101        ; e
    STORE r0, r14
    LDI r0, 0x1708
    LDI r14, 62         ; >
    STORE r0, r14
    LDI r0, 0x1709
    LDI r14, 0
    STORE r0, r14
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r9, 9
    LDI r4, 0x1700
    TEXT r9, r1, r4
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    JMP exec_done

do_cp:
    ; Copy a file: cp <src> <dst>
    ; Arguments at 0x0600, separated by space
    ; Parse second argument from 0x0600 into 0x1800
    LDI r0, 0x0600
    LOAD r14, r0
    JZ r14, cp_usage
    ; Find space separator
    LDI r6, 0x0600
cp_find_space:
    LOAD r14, r6
    JZ r14, cp_usage    ; no space found -- need 2 args
    LDI r1, 32         ; space
    CMP r14, r1
    JZ r14, cp_found_space
    LDI r14, 1
    ADD r6, r14
    JMP cp_find_space
cp_found_space:
    ; Skip the space, copy rest to 0x1800
    LDI r14, 1
    ADD r6, r14
    LDI r11, 0x1800
cp_copy_dst:
    LOAD r14, r6
    JZ r14, cp_copy_dst_done
    STORE r11, r14
    LDI r14, 1
    ADD r6, r14
    ADD r11, r14
    JMP cp_copy_dst
cp_copy_dst_done:
    LDI r14, 0
    STORE r11, r14
    ; Null-terminate the source filename (replace space with 0)
    LDI r6, 0x0600
    LDI r11, 0x1600
cp_copy_src:
    LOAD r14, r6
    JZ r14, cp_src_done
    LDI r1, 32
    CMP r14, r1
    JZ r14, cp_src_terminate
    STORE r11, r14
    LDI r14, 1
    ADD r6, r14
    ADD r11, r14
    JMP cp_copy_src
cp_src_terminate:
    LDI r14, 0
    STORE r11, r14
    JMP cp_do_copy
cp_src_done:
    STORE r11, r14
cp_do_copy:
    ; FCOPY r1, r9 where r1=0x1600 (src), r9=0x1800 (dst)
    LDI r1, 0x1600
    LDI r9, 0x1800
    FCOPY r1, r9
    ; Check result
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JNZ r14, cp_ok
    ; Print error
    LDI r0, 0x1700
    LDI r14, 99         ; c
    STORE r0, r14
    LDI r0, 0x1701
    LDI r14, 112        ; p
    STORE r0, r14
    LDI r0, 0x1702
    LDI r14, 58         ; :
    STORE r0, r14
    LDI r0, 0x1703
    LDI r14, 32         ; space
    STORE r0, r14
    LDI r0, 0x1704
    LDI r14, 101        ; e
    STORE r0, r14
    LDI r0, 0x1705
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1706
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1707
    LDI r14, 111        ; o
    STORE r0, r14
    LDI r0, 0x1708
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1709
    LDI r14, 0
    STORE r0, r14
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r9, 9
    LDI r4, 0x1700
    TEXT r9, r1, r4
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    JMP exec_done
cp_ok:
    JMP exec_done
cp_usage:
    LDI r0, 0x1700
    LDI r14, 99         ; c
    STORE r0, r14
    LDI r0, 0x1701
    LDI r14, 112        ; p
    STORE r0, r14
    LDI r0, 0x1702
    LDI r14, 32         ; space
    STORE r0, r14
    LDI r0, 0x1703
    LDI r14, 60         ; <
    STORE r0, r14
    LDI r0, 0x1704
    LDI r14, 115        ; s
    STORE r0, r14
    LDI r0, 0x1705
    LDI r14, 114        ; r
    STORE r0, r14
    LDI r0, 0x1706
    LDI r14, 99        ; c
    STORE r0, r14
    LDI r0, 0x1707
    LDI r14, 62         ; >
    STORE r0, r14
    LDI r0, 0x1708
    LDI r14, 32         ; space
    STORE r0, r14
    LDI r0, 0x1709
    LDI r14, 60         ; <
    STORE r0, r14
    LDI r0, 0x170A
    LDI r14, 100        ; d
    STORE r0, r14
    LDI r0, 0x170B
    LDI r14, 115        ; s
    STORE r0, r14
    LDI r0, 0x170C
    LDI r14, 116        ; t
    STORE r0, r14
    LDI r0, 0x170D
    LDI r14, 62         ; >
    STORE r0, r14
    LDI r0, 0x170E
    LDI r14, 0
    STORE r0, r14
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r9, 14
    LDI r4, 0x1700
    TEXT r9, r1, r4
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    JMP exec_done

do_hypervisor:
    PUSH r11
    PUSH r6
    ; Check if argument exists
    LDI r0, 0x0600
    LOAD r14, r0
    JZ r14, hypervisor_usage

    ; Copy argument (0x0600) to config buffer (0x1B00)
    LDI r6, 0x0600       ; src
    LDI r11, 0x1B00       ; dst
hypervisor_copy:
    LOAD r14, r6
    JZ r14, hypervisor_copy_done
    STORE r11, r14
    LDI r14, 1
    ADD r6, r14
    ADD r11, r14
    JMP hypervisor_copy
hypervisor_copy_done:
    LDI r14, 0
    STORE r11, r14         ; null terminate

    ; Call HYPERVISOR with config buffer address
    LDI r14, 0x1B00
    HYPERVISOR r14

    ; Check result: 0 = success, 0xFFFFFFFF = error, 0xFFFFFFFD = missing arch
    JZ r14, hypervisor_ok
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, hypervisor_err
    ; Missing arch or other error
    JMP hypervisor_err

hypervisor_ok:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    ; Display "hypervisor started" message
    LDI r9, 4
    LDI r4, hypervisor_ok_msg
    TEXT r9, r1, r4
    JMP hypervisor_done

hypervisor_usage:
    ; No argument -- show usage
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, hypervisor_usage_msg
    TEXT r9, r1, r4
    JMP hypervisor_done

hypervisor_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, hypervisor_err_msg
    TEXT r9, r1, r4
    JMP hypervisor_done

hypervisor_done:
    POP r6
    POP r11
    JMP exec_done

do_edit:
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12

    ; Check for argument
    LDI r0, 0x0600
    LOAD r14, r0
    JZ r14, edit_usage

    ; Open file for reading
    LDI r1, 0x0600       ; filename addr
    LDI r9, 0            ; mode = read
    OPEN r1, r9           ; r14 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, edit_err      ; file not found

    MOV r10, r14            ; save fd in r10

    ; Read file content into buffer at 0x2000
    LDI r4, 0x2000        ; read buffer (8KB, up to row 127 * 32 cols)
    LDI r7, 4096          ; max words to read
    READ r10, r4, r7       ; r14 = bytes read

    ; Close the file
    CLOSE r10

    ; Null terminate at position bytes_read
    LDI r5, 0x2000
    ADD r5, r14            ; r5 = buffer + bytes_read
    LDI r13, 0
    STORE r5, r13          ; null terminator

    ; Display file content on screen, line by line
    ; Each line is up to 32 chars, separated by newline (10) or null
    LDI r3, 0x2000       ; source pointer
    LDI r2, 4            ; y position (start near top)
    LDI r12, 0            ; line buffer index

edit_line_loop:
    LOAD r14, r3
    JZ r14, edit_done      ; null = end of file

    ; Check for newline (10)
    LDI r1, 10
    CMP r14, r1
    JZ r14, edit_newline

    ; Store char in line buffer at 0x2100 + index
    LDI r6, 0x2100
    ADD r6, r12
    STORE r6, r14

    LDI r1, 1
    ADD r3, r1           ; advance source
    ADD r12, r1           ; advance line index

    ; Check if line is 32 chars (screen width at 8px font)
    LDI r1, 32
    CMP r12, r1
    JZ r14, edit_line_full
    JMP edit_line_loop

edit_newline:
    ; Null-terminate current line
    LDI r6, 0x2100
    ADD r6, r12
    LDI r14, 0
    STORE r6, r14

    ; Display line at y position
    LDI r9, 4             ; x = 4
    LDI r4, 0x2100        ; line buffer
    TEXT r9, r2, r4      ; render text at (4, y)

    ; Advance to next line
    LDI r1, 1
    ADD r3, r1           ; skip the newline char
    ADD r2, r1           ; next y position
    LDI r12, 0            ; reset line buffer index
    JMP edit_line_loop

edit_line_full:
    ; Null-terminate
    LDI r6, 0x2100
    ADD r6, r12
    LDI r14, 0
    STORE r6, r14

    ; Display line
    LDI r9, 4
    LDI r4, 0x2100
    TEXT r9, r2, r4

    ; Next line (no source advance since char was already stored)
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    LDI r12, 0
    JMP edit_line_loop

edit_done:
    ; Null-terminate last line if there's content
    JZ r12, edit_show_msg
    LDI r6, 0x2100
    ADD r6, r12
    LDI r14, 0
    STORE r6, r14
    LDI r9, 4
    LDI r4, 0x2100
    TEXT r9, r2, r4

edit_show_msg:
    ; Show "[edit: filename]" at bottom
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, edit_ok_msg
    TEXT r9, r1, r4
    JMP edit_cleanup

edit_usage:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, edit_usage_msg
    TEXT r9, r1, r4
    JMP edit_cleanup

edit_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, edit_err_msg
    TEXT r9, r1, r4

edit_cleanup:
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

do_save:
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12

    ; Check for argument
    LDI r0, 0x0600
    LOAD r14, r0
    JZ r14, save_usage

    ; Open file for writing (mode 1 = write/create)
    LDI r1, 0x0600       ; filename addr
    LDI r9, 1            ; mode = write
    OPEN r1, r9           ; r14 = fd
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, save_err      ; could not create file

    MOV r10, r14            ; save fd in r10

    ; Calculate content length from edit buffer at 0x2000
    ; Scan for null terminator
    LDI r3, 0x2000
    LDI r2, 0            ; length counter
save_scan:
    LOAD r14, r3
    JZ r14, save_scan_done
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    JMP save_scan

save_scan_done:
    ; If nothing to save, show message
    JZ r2, save_empty

    ; Write content to file
    LDI r1, 0x2000        ; buffer addr
    MOV r9, r1             ; fd_reg = r10 already
    ; WRITE fd_reg, buf_reg, len_reg
    MOV r1, r10             ; r1 = fd
    LDI r9, 0x2000         ; buf addr
    MOV r4, r2            ; length
    WRITE r1, r9, r4       ; r14 = bytes written

    CLOSE r10               ; close file

    ; Show "[saved: N bytes]" message
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, save_ok_msg
    TEXT r9, r1, r4
    JMP save_cleanup

save_empty:
    CLOSE r10
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, save_empty_msg
    TEXT r9, r1, r4
    JMP save_cleanup

save_usage:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, save_usage_msg
    TEXT r9, r1, r4
    JMP save_cleanup

save_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, save_err_msg
    TEXT r9, r1, r4

save_cleanup:
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

do_grep:
    ; grep <pattern> <file> -- search file for lines containing pattern
    ; Argument at 0x0600 is "pattern file"
    ; We need to split: first word = pattern, second word = filename
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12
    PUSH r2
    PUSH r3

    ; Parse argument: find first space to split pattern from filename
    ; Store pattern at 0x2200, filename at 0x2300
    LDI r3, 0x0600      ; arg pointer
    LDI r2, 0x2200      ; pattern buffer
    LDI r12, 0           ; pattern length

grep_parse_pat:
    LOAD r14, r3
    JZ r14, grep_no_file   ; no space found, error
    LDI r1, 32            ; space
    CMP r14, r1
    JZ r14, grep_copy_file
    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    ADD r12, r1
    JMP grep_parse_pat

grep_copy_file:
    ; Skip the space
    LDI r1, 1
    ADD r3, r1
    ; Copy filename to 0x2300
    LDI r2, 0x2300

grep_copy_file_loop:
    LOAD r14, r3
    JZ r14, grep_have_file
    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    JMP grep_copy_file_loop

grep_have_file:
    LDI r14, 0
    STORE r2, r14         ; null terminate filename
    ; Null terminate pattern
    LDI r2, 0x2200
    ADD r2, r12
    STORE r2, r14

    ; Check pattern length > 0
    JZ r12, grep_err

    ; Open file
    LDI r1, 0x2300       ; filename addr
    LDI r9, 0            ; mode = read
    OPEN r1, r9           ; r14 = fd
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, grep_err

    MOV r10, r14            ; save fd

    ; Read file content into 0x2000
    LDI r4, 0x2000
    LDI r7, 400           ; max bytes to read
    READ r10, r4, r7
    CLOSE r10

    ; Null terminate at read position
    LDI r5, 0x2000
    ADD r5, r14
    LDI r13, 0
    STORE r5, r13

    ; Scan file line by line, check if each line contains the pattern
    ; Line buffer at 0x2400, max 64 chars
    ; Save file pointer at 0x2380 (pattern_len * 4 + pattern_buf end)
    ; Actually, save at 0x23FF (safe scratch)
    LDI r3, 0x2000       ; file pointer
    LDI r6, 0            ; match count

grep_line_loop:
    ; Save file pointer to scratch
    MOV r15, r3           ; r15 = saved file ptr

    LOAD r14, r3
    JZ r14, grep_done       ; end of file

    ; Copy line to buffer at 0x2400, track length
    LDI r2, 0x2400
    LDI r12, 0            ; line length

grep_copy_line:
    LOAD r14, r3
    JZ r14, grep_check_line     ; end of file, check this line
    LDI r1, 10                 ; newline
    CMP r14, r1
    JZ r14, grep_advance_nl
    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    ADD r12, r1
    LDI r1, 64
    CMP r12, r1
    JZ r14, grep_check_line
    JMP grep_copy_line

grep_advance_nl:
    LDI r1, 1
    ADD r3, r1             ; skip newline

grep_check_line:
    ; Null terminate line buffer
    LDI r14, 0
    STORE r2, r14

    ; Compute pattern length (scan 0x2200 for null)
    LDI r11, 0
    LDI r8, 0x2200

grep_scan_pat_len:
    LOAD r14, r8
    JZ r14, grep_have_pat_len
    LDI r1, 1
    ADD r8, r1
    ADD r11, r1
    JMP grep_scan_pat_len

grep_have_pat_len:
    ; r11 = pattern length, r12 = line length
    ; Skip if line shorter than pattern
    CMP r12, r11
    BLT r14, grep_next_line

    ; Simple substring search: check each starting position
    ; r12 - r11 = max starting position
    SUB r12, r11           ; r12 = max_start (line_len - pat_len)

grep_search_pos:
    ; r2 = current position in line (0x2400 + offset)
    ; Use offset tracking instead of absolute address comparison
    LDI r0, 0              ; search offset

grep_search_pos2:
    CMP r0, r12            ; offset vs max_start
    BGE r14, grep_next_line

    ; Compare pattern with line at offset r0
    LDI r8, 0x2400
    ADD r8, r0            ; r8 = line_base + offset
    LDI r6, 0x2200        ; pattern start
    LDI r1, 0              ; chars matched

grep_cmp_loop:
    LOAD r14, r8
    LOAD r9, r6
    CMP r14, r9
    JNZ r14, grep_no_match_here
    ; Match so far
    LDI r4, 1
    ADD r8, r4
    ADD r6, r4
    ADD r1, r4             ; count matched chars
    CMP r1, r11            ; matched vs pattern_len
    BLT r14, grep_cmp_loop
    JMP grep_found_match

grep_no_match_here:
    LDI r4, 1
    ADD r0, r4             ; advance offset
    JMP grep_search_pos2

grep_found_match:
    ; Display the matching line
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x2400
    TEXT r9, r1, r4

grep_next_line:
    ; Restore file pointer from r15
    MOV r3, r15
    JMP grep_line_loop

grep_no_file:
    ; Missing filename argument
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, grep_usage
    TEXT r9, r1, r4
    JMP grep_cleanup

grep_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, grep_err_msg
    TEXT r9, r1, r4
    JMP grep_cleanup

grep_done:
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

grep_cleanup:
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

do_head:
    ; head <file> [N] -- display first N lines (default 10)
    ; Argument at 0x0600 is "file N"
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12
    PUSH r2
    PUSH r3

    ; Parse: filename at 0x0600, optional number after space
    ; Copy filename to 0x2200, check for trailing number
    LDI r3, 0x0600
    LDI r2, 0x2200

head_copy_name:
    LOAD r14, r3
    JZ r14, head_name_done
    LDI r1, 32
    CMP r14, r1
    JZ r14, head_parse_n
    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    JMP head_copy_name

head_parse_n:
    ; Skip space
    LDI r1, 1
    ADD r3, r1
    ; Parse number (single digit 1-9 for simplicity)
    LDI r11, 10           ; default N = 10
    LOAD r14, r3
    JZ r14, head_name_done  ; no number, use default
    ; Subtract '0' (48) to get digit
    LDI r1, 48
    SUB r14, r1
    ; If result is 1-9, use it; else default 10
    LDI r1, 1
    CMP r14, r1
    BLT r14, head_name_done
    LDI r1, 9
    CMP r14, r1
    BGE r14, head_name_done
    MOV r11, r14           ; use parsed N

head_name_done:
    LDI r14, 0
    STORE r2, r14         ; null terminate filename

    ; Check for empty filename
    LDI r2, 0x2200
    LOAD r14, r2
    JZ r14, head_err

    ; Open file
    LDI r1, 0x2200
    LDI r9, 0
    OPEN r1, r9
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, head_err

    MOV r10, r14
    LDI r4, 0x2000
    LDI r7, 400
    READ r10, r4, r7
    CLOSE r10

    ; Null terminate
    LDI r5, 0x2000
    ADD r5, r14
    LDI r13, 0
    STORE r5, r13

    ; Display first N lines
    LDI r3, 0x2000       ; file pointer
    LDI r2, 0x2400       ; line buffer
    LDI r6, 0            ; line count
    LDI r12, 0            ; chars in line

head_read_line:
    LOAD r14, r3
    JZ r14, head_done      ; end of file

    LDI r1, 10
    CMP r14, r1
    JZ r14, head_print_line

    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    ADD r12, r1
    LDI r1, 32
    CMP r12, r1
    BLT r14, head_read_line
    ; Line too long, print what we have
    JMP head_print_line

head_print_line:
    ; Null terminate
    LDI r14, 0
    STORE r2, r14
    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x2400
    TEXT r9, r1, r4

    ; Increment line count, check limit
    LDI r1, 1
    ADD r6, r1
    CMP r6, r11
    BGE r14, head_done

    ; Skip newline if present
    LOAD r14, r3
    LDI r1, 10
    CMP r14, r1
    JZ r14, head_skip_nl
    JMP head_reset_line

head_skip_nl:
    LDI r1, 1
    ADD r3, r1

head_reset_line:
    LDI r2, 0x2400
    LDI r12, 0
    JMP head_read_line

head_done:
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

head_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, head_usage_msg
    TEXT r9, r1, r4
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

do_tail:
    ; tail <file> [N] -- display last N lines (default 10)
    ; Strategy: read whole file, count newlines, display last N
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12
    PUSH r2
    PUSH r3

    ; Parse: filename at 0x0600, optional number
    LDI r3, 0x0600
    LDI r2, 0x2200

tail_copy_name:
    LOAD r14, r3
    JZ r14, tail_name_done
    LDI r1, 32
    CMP r14, r1
    JZ r14, tail_parse_n
    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    JMP tail_copy_name

tail_parse_n:
    LDI r1, 1
    ADD r3, r1
    LDI r11, 10           ; default N = 10
    LOAD r14, r3
    JZ r14, tail_name_done
    LDI r1, 48
    SUB r14, r1
    LDI r1, 1
    CMP r14, r1
    BLT r14, tail_name_done
    LDI r1, 9
    CMP r14, r1
    BGE r14, tail_name_done
    MOV r11, r14

tail_name_done:
    LDI r14, 0
    STORE r2, r14

    LDI r2, 0x2200
    LOAD r14, r2
    JZ r14, tail_err

    ; Open and read file
    LDI r1, 0x2200
    LDI r9, 0
    OPEN r1, r9
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, tail_err

    MOV r10, r14
    LDI r4, 0x2000
    LDI r7, 400
    READ r10, r4, r7
    CLOSE r10

    LDI r5, 0x2000
    ADD r5, r14
    LDI r13, 0
    STORE r5, r13

    ; Count total lines
    LDI r3, 0x2000
    LDI r6, 1            ; line count (at least 1)

tail_count_lines:
    LOAD r14, r3
    JZ r14, tail_count_done
    LDI r1, 10
    CMP r14, r1
    JNZ r14, tail_count_next
    LDI r1, 1
    ADD r6, r1           ; increment line count
tail_count_next:
    LDI r1, 1
    ADD r3, r1
    JMP tail_count_lines

tail_count_done:
    ; Compute start line: total_lines - N (but min 1)
    MOV r2, r6           ; total_lines
    SUB r2, r11           ; total - N
    LDI r1, 1
    CMP r2, r1
    BGE r14, tail_skip_ok
    MOV r2, r1            ; at least line 1

tail_skip_ok:
    ; Skip to start line
    LDI r3, 0x2000
    LDI r6, 1             ; current line

tail_skip_loop:
    CMP r6, r2
    BGE r14, tail_display   ; reached start line

tail_skip_next:
    LOAD r14, r3
    JZ r14, tail_done       ; end of file
    LDI r1, 10
    CMP r14, r1
    JNZ r14, tail_skip_adv
    LDI r1, 1
    ADD r6, r1            ; next line on newline
tail_skip_adv:
    LDI r1, 1
    ADD r3, r1
    JMP tail_skip_loop

tail_display:
    ; Display remaining lines
    LDI r2, 0x2400       ; line buffer
    LDI r12, 0            ; chars in line

tail_read_char:
    LOAD r14, r3
    JZ r14, tail_flush
    LDI r1, 10
    CMP r14, r1
    JZ r14, tail_flush

    STORE r2, r14
    LDI r1, 1
    ADD r3, r1
    ADD r2, r1
    ADD r12, r1
    LDI r1, 32
    CMP r12, r1
    BLT r14, tail_read_char
    JMP tail_flush

tail_flush:
    LDI r14, 0
    STORE r2, r14
    ; Display line
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x2400
    TEXT r9, r1, r4

    ; Check if we consumed a newline
    LOAD r14, r3
    LDI r1, 10
    CMP r14, r1
    JZ r14, tail_skip_newline

tail_reset:
    LDI r2, 0x2400
    LDI r12, 0
    LOAD r14, r3
    JZ r14, tail_done
    JMP tail_read_char

tail_skip_newline:
    LDI r1, 1
    ADD r3, r1
    JMP tail_reset

tail_done:
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

tail_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, tail_usage_msg
    TEXT r9, r1, r4
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

do_wc:
    ; wc <file> -- count lines, words, and bytes
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12
    PUSH r2
    PUSH r3

    ; Check for argument
    LDI r0, 0x0600
    LOAD r14, r0
    JZ r14, wc_err

    ; Open file
    LDI r1, 0x0600
    LDI r9, 0
    OPEN r1, r9
    LDI r1, 0xFFFFFFFF
    CMP r14, r1
    JZ r14, wc_err

    MOV r10, r14
    LDI r4, 0x2000
    LDI r7, 400
    READ r10, r4, r7
    MOV r12, r14           ; save byte count
    CLOSE r10

    ; Null terminate
    LDI r5, 0x2000
    ADD r5, r14
    LDI r13, 0
    STORE r5, r13

    ; Count lines and words
    LDI r3, 0x2000       ; file pointer
    LDI r6, 0            ; line count
    LDI r11, 0            ; word count
    LDI r8, 0            ; prev was space (1=yes, 0=no)

wc_scan:
    LOAD r14, r3
    JZ r14, wc_format      ; end of file

    ; Count newlines
    LDI r1, 10
    CMP r14, r1
    JNZ r14, wc_not_nl
    LDI r1, 1
    ADD r6, r1           ; line++
    LDI r8, 1            ; prev = space
    JMP wc_next

wc_not_nl:
    ; Count words: space or other whitespace transitions
    LDI r1, 32            ; space
    CMP r14, r1
    JNZ r14, wc_not_space
    LDI r8, 1            ; prev = space
    JMP wc_next

wc_not_space:
    ; If prev was space and current is not, it is a new word
    LDI r1, 1
    CMP r8, r1
    JNZ r14, wc_next
    ADD r11, r1           ; word++
    LDI r8, 0            ; prev = not space

wc_next:
    LDI r1, 1
    ADD r3, r1
    JMP wc_scan

wc_format:
    ; Build output string at 0x2400: "N N N"
    ; Format: lines words bytes
    LDI r2, 0x2400

    ; Convert lines (r6) to decimal
    CALL wc_utoa
    ; Add space
    LDI r14, 32
    STORE r2, r14
    LDI r1, 1
    ADD r2, r1

    ; Convert words (r11) to decimal
    MOV r3, r11
    CALL wc_utoa
    ; Add space
    LDI r14, 32
    STORE r2, r14
    LDI r1, 1
    ADD r2, r1

    ; Convert bytes (r12) to decimal
    MOV r3, r12
    CALL wc_utoa
    ; Null terminate
    LDI r14, 0
    STORE r2, r14

    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x2400
    TEXT r9, r1, r4
    JMP wc_cleanup

wc_utoa:
    ; Convert r3 to decimal, write to buffer at r2
    ; Modifies r3, does not change r2 (caller manages it)
    PUSH r8
    ; Handle 0 case
    JNZ r3, wc_utoa_nonzero
    LDI r14, 48            ; '0'
    STORE r2, r14
    LDI r1, 1
    ADD r2, r1
    POP r8
    RET

wc_utoa_nonzero:
    ; Find number of digits by repeated division
    LDI r8, 0            ; digit count
    LDI r6, 10
    MOV r11, r3          ; temp copy

wc_count_digits:
    JZ r11, wc_do_digits
    LDI r1, 10
    DIV r11, r1
    LDI r1, 1
    ADD r8, r1
    JMP wc_count_digits

wc_do_digits:
    ; r8 = digit count. We need to write digits from most significant.
    ; Write digits to a temp area at 0x2500, then copy in order.
    LDI r6, 0x2500       ; temp digit buffer
    LDI r11, 0            ; digit index
    MOV r3, r11          ; restore original? No, r3 was modified.
    ; Actually we need to re-do the conversion. Let me use a simpler approach:
    ; Write digits in reverse order, then reverse them.
    ; Even simpler: since max bytes ~400, max 3 digits. Handle up to 999.
    POP r8
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12

    ; Save r2 (output pointer)
    MOV r12, r2

    ; Write digits in reverse at 0x2500
    LDI r6, 0x2500
    LDI r11, 0            ; digit count

wc_div_loop:
    JZ r3, wc_rev_digits
    LDI r1, 10
    DIV r3, r1
    LDI r1, 48            ; '0'
    ADD r14, r1            ; r14 = digit char
    STORE r6, r14
    LDI r1, 1
    ADD r6, r1
    ADD r11, r1
    JMP wc_div_loop

wc_rev_digits:
    ; r11 = digit count at 0x2500 (reversed)
    ; Copy in reverse order to output
    JZ r11, wc_utoa_done
    LDI r1, 1
    SUB r11, r1
    LDI r6, 0x2500
    ADD r6, r11
    LOAD r14, r6
    STORE r12, r14
    LDI r1, 1
    ADD r12, r1
    JMP wc_rev_digits

wc_utoa_done:
    MOV r2, r12          ; update output pointer
    POP r12
    POP r6
    POP r11
    POP r8
    POP r8
    RET

wc_err:
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, wc_usage_msg
    TEXT r9, r1, r4
wc_cleanup:
    POP r3
    POP r2
    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

do_date:
    ; Display ticks since boot (proxy for uptime)
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12

    ; Read TICKS from RAM[0xFFE]
    LDI r0, 0xFFE
    LOAD r3, r0           ; r3 = ticks

    ; Build output: "ticks: NNNN" at 0x2400
    LDI r2, 0x2400
    ; Write "ticks: "
    LDI r14, 116           ; t
    STORE r2, r14
    LDI r1, 1
    ADD r2, r1
    LDI r14, 105           ; i
    STORE r2, r14
    ADD r2, r1
    LDI r14, 99            ; c
    STORE r2, r14
    ADD r2, r1
    LDI r14, 107           ; k
    STORE r2, r14
    ADD r2, r1
    LDI r14, 115           ; s
    STORE r2, r14
    ADD r2, r1
    LDI r14, 58            ; :
    STORE r2, r14
    ADD r2, r1
    LDI r14, 32            ; space
    STORE r2, r14
    ADD r2, r1

    ; Convert ticks to decimal
    CALL date_utoa

    ; Null terminate
    LDI r14, 0
    STORE r2, r14

    ; Display
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r9, 4
    LDI r4, 0x2400
    TEXT r9, r1, r4

    POP r12
    POP r6
    POP r11
    POP r8
    JMP exec_done

date_utoa:
    ; Convert r3 to decimal, write to buffer at r2
    PUSH r8
    PUSH r11
    PUSH r6
    PUSH r12

    MOV r12, r2

    ; Handle 0
    JNZ r3, date_nonzero
    LDI r14, 48
    STORE r2, r14
    LDI r1, 1
    ADD r2, r1
    POP r12
    POP r6
    POP r11
    POP r8
    RET

date_nonzero:
    ; Write digits in reverse at 0x2600
    LDI r6, 0x2600
    LDI r11, 0

date_div:
    JZ r3, date_rev
    LDI r1, 10
    DIV r3, r1
    LDI r1, 48
    ADD r14, r1
    STORE r6, r14
    LDI r1, 1
    ADD r6, r1
    ADD r11, r1
    JMP date_div

date_rev:
    JZ r11, date_done
    LDI r1, 1
    SUB r11, r1
    LDI r6, 0x2600
    ADD r6, r11
    LOAD r14, r6
    STORE r12, r14
    LDI r1, 1
    ADD r12, r1
    JMP date_rev

date_done:
    MOV r2, r12
    POP r12
    POP r6
    POP r11
    POP r8
    RET

do_exec:
    ; Execute external program via EXEC
    ; Command name at 0x0400
    LDI r1, 0x0400
    EXEC r1               ; r14 = PID or error
    ; Check for error
    LDI r9, 0xFFFFFFFF
    CMP r14, r9
    JZ r14, exec_error

    ; Save PID
    LDI r0, 0x1202
    STORE r0, r14

    ; Wait for child to complete
exec_wait:
    LDI r1, 0x1202
    LOAD r1, r0
    WAITPID r1
    JZ r14, exec_wait     ; still running

    ; Check for pipe mode
    LDI r0, 0x1207
    LOAD r14, r0
    LDI r1, 1
    CMP r14, r1
    JZ r14, exec_pipe

    JMP exec_done

exec_pipe:
    ; Execute second command from pipe buffer
    LDI r1, 0x1400
    EXEC r1
    LDI r0, 0x1202
    STORE r0, r14
exec_pipe_wait:
    LDI r1, 0x1202
    LOAD r1, r0
    WAITPID r1
    JZ r14, exec_pipe_wait
    JMP exec_done

exec_error:
    ; Display "command not found"
    LDI r0, 0x1201
    LOAD r1, r0
    LDI r14, 12
    ADD r1, r14
    STORE r0, r1
    LDI r4, not_found_msg
    LDI r9, 4
    TEXT r9, r1, r4
    JMP exec_done

; ═══════════════════════════════════════════════════════════════
; Data section
; ═══════════════════════════════════════════════════════════════
.org 0x1A00

prompt_str:
    ; "> " stored as ASCII bytes
    ; 62 = '>', 32 = ' ', 0 = null
    .byte 62
    .byte 32
    .byte 0

.org 0x1A10

help_text:
    .byte 104 ; h
    .byte 101 ; e
    .byte 108 ; l
    .byte 112 ; p
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 99  ; c
    .byte 104 ; h
    .byte 111 ; o
    .byte 32  ; space
    .byte 108 ; l
    .byte 115 ; s
    .byte 32  ; space
    .byte 99  ; c
    .byte 97  ; a
    .byte 116 ; t
    .byte 32  ; space
    .byte 101 ; e
    .byte 100  ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 32  ; space
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 32  ; space
    .byte 112 ; p
    .byte 115  ; s
    .byte 32  ; space
    .byte 107 ; k
    .byte 105 ; i
    .byte 108 ; l
    .byte 108 ; l
    .byte 32  ; space
    .byte 114 ; r
    .byte 109 ; m
    .byte 32  ; space
    .byte 99  ; c
    .byte 112 ; p
    .byte 32  ; space
    .byte 99  ; c
    .byte 108 ; l
    .byte 101 ; e
    .byte 97  ; a
    .byte 114 ; r
    .byte 32  ; space
    .byte 101 ; e
    .byte 120 ; x
    .byte 112 ; p
    .byte 111 ; o
    .byte 114 ; r
    .byte 116 ; t
    .byte 32  ; space
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 32  ; space
    .byte 103 ; g
    .byte 114 ; r
    .byte 101 ; e
    .byte 112 ; p
    .byte 32  ; space
    .byte 104 ; h
    .byte 101 ; e
    .byte 97  ; a
    .byte 100 ; d
    .byte 32  ; space
    .byte 116 ; t
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 32  ; space
    .byte 119 ; w
    .byte 99  ; c
    .byte 32  ; space
    .byte 100 ; d
    .byte 97  ; a
    .byte 116 ; t
    .byte 101 ; e
    .byte 0

; Data blocks reordered for monotonically increasing .org addresses
; (original kill_msg was at 0x1AD0, moved to 0x1AF0 to fix backward .org)

.org 0x1A80

export_msg:
    .byte 101 ; e
    .byte 120 ; x
    .byte 112 ; p
    .byte 111 ; o
    .byte 114 ; r
    .byte 116 ; t
    .byte 58  ; :
    .byte 32  ; space
    .byte 115 ; s
    .byte 101 ; e
    .byte 116  ; t
    .byte 0

.org 0x1AA0

not_found_msg:
    .byte 99  ; c
    .byte 111 ; o
    .byte 109 ; m
    .byte 109 ; m
    .byte 97  ; a
    .byte 110 ; n
    .byte 100 ; d
    .byte 32  ; space
    .byte 110 ; n
    .byte 111 ; o
    .byte 116 ; t
    .byte 32  ; space
    .byte 102 ; f
    .byte 111 ; o
    .byte 117 ; u
    .byte 110 ; n
    .byte 100 ; d
    .byte 0

.org 0x1AC0

hypervisor_usage_msg:
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 32  ; space
    .byte 97  ; a
    .byte 114 ; r
    .byte 99  ; c
    .byte 104 ; h
    .byte 61  ; =
    .byte 60  ; <
    .byte 97  ; a
    .byte 114 ; r
    .byte 99  ; c
    .byte 104 ; h
    .byte 62  ; >
    .byte 32  ; space
    .byte 107 ; k
    .byte 101 ; e
    .byte 114 ; r
    .byte 110 ; n
    .byte 101 ; e
    .byte 108 ; l
    .byte 61  ; =
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

.org 0x1AF0

kill_msg:
    .byte 107 ; k
    .byte 105 ; i
    .byte 108 ; l
    .byte 108 ; l
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; e
    .byte 32  ; space
    .byte 107 ; k
    .byte 105 ; i
    .byte 108 ; l
    .byte 32  ; space
    .byte 60  ; <
    .byte 112 ; p
    .byte 105 ; i
    .byte 100 ; d
    .byte 62  ; >
    .byte 0

.org 0x1B10

hypervisor_err_msg:
hypervisor_err_msg:
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 58  ; :
    .byte 32  ; space
    .byte 102 ; f
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 100 ; d
    .byte 0

.org 0x1C00

; Config buffer for hypervisor arguments is at 0x1B00 (hardcoded in do_hypervisor).

grep_err_msg:
    .byte 103 ; g
    .byte 114 ; r
    .byte 101 ; e
    .byte 112 ; p
    .byte 58  ; :
    .byte 32  ; space
    .byte 110 ; n
    .byte 111 ; o
    .byte 32  ; space
    .byte 109 ; m
    .byte 97  ; a
    .byte 116 ; c
    .byte 104 ; h
    .byte 0

head_usage_msg:
    .byte 104 ; h
    .byte 101 ; e
    .byte 97  ; a
    .byte 100 ; d
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 0

tail_usage_msg:
    .byte 116 ; t
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 0

wc_usage_msg:
    .byte 119 ; w
    .byte 99  ; c
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 0

hypervisor_ok_msg:
    .byte 104 ; h
    .byte 121 ; y
    .byte 112 ; p
    .byte 101 ; e
    .byte 114 ; r
    .byte 118 ; v
    .byte 105 ; i
    .byte 115 ; s
    .byte 111 ; o
    .byte 114 ; r
    .byte 58  ; :
    .byte 32  ; space
    .byte 115 ; s
    .byte 116 ; t
    .byte 97  ; a
    .byte 114 ; r
    .byte 116 ; t
    .byte 101 ; e
    .byte 100 ; d
    .byte 0

.org 0x1D00

edit_ok_msg:
    .byte 91  ; [
    .byte 101 ; e
    .byte 100 ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 58  ; :
    .byte 32  ; space
    .byte 111 ; o
    .byte 107 ; k
    .byte 93  ; ]
    .byte 0

.org 0x1D10

edit_usage_msg:
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 100 ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

.org 0x1D30

edit_err_msg:
    .byte 101 ; e
    .byte 100 ; d
    .byte 105 ; i
    .byte 116 ; t
    .byte 58  ; :
    .byte 32  ; space
    .byte 110 ; n
    .byte 111 ; o
    .byte 116 ; t
    .byte 32  ; space
    .byte 102 ; f
    .byte 111 ; o
    .byte 117 ; u
    .byte 110 ; n
    .byte 100 ; d
    .byte 0

.org 0x1D50

save_ok_msg:
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 100 ; d
    .byte 0

.org 0x1D60

save_empty_msg:
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 109 ; m
    .byte 112 ; p
    .byte 116 ; t
    .byte 121 ; y
    .byte 0

.org 0x1D80

save_usage_msg:
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

.org 0x1DA0

save_err_msg:
    .byte 115 ; s
    .byte 97  ; a
    .byte 118 ; v
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 101 ; e
    .byte 114 ; r
    .byte 114 ; r
    .byte 111 ; o
    .byte 114 ; r
    .byte 0

.org 0x1DC0

grep_usage:
    .byte 103 ; g
    .byte 114 ; r
    .byte 101 ; e
    .byte 112 ; p
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 112 ; p
    .byte 97  ; a
    .byte 116 ; t
    .byte 62  ; >
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

grep_no_match:
    .byte 40  ; (
    .byte 110 ; n
    .byte 111 ; o
    .byte 32  ; space
    .byte 109 ; m
    .byte 97  ; a
    .byte 116 ; t
    .byte 99  ; c
    .byte 104 ; h
    .byte 41  ; )
    .byte 0

head_usage:
    .byte 104 ; h
    .byte 101 ; e
    .byte 97  ; a
    .byte 100 ; d
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 110 ; n
    .byte 62  ; >
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

tail_usage:
    .byte 116 ; t
    .byte 97  ; a
    .byte 105 ; i
    .byte 108 ; l
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 110 ; n
    .byte 62  ; >
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

wc_usage:
    .byte 119 ; w
    .byte 99  ; c
    .byte 58  ; :
    .byte 32  ; space
    .byte 117 ; u
    .byte 115 ; s
    .byte 97  ; a
    .byte 103 ; g
    .byte 101 ; e
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

wc_none:
    .byte 48  ; 0
    .byte 32  ; space
    .byte 48  ; 0
    .byte 32  ; space
    .byte 48  ; 0
    .byte 32  ; space
    .byte 60  ; <
    .byte 102 ; f
    .byte 105 ; i
    .byte 108 ; l
    .byte 101 ; e
    .byte 62  ; >
    .byte 0

date_str:
    .byte 117 ; u
    .byte 112 ; p
    .byte 116 ; t
    .byte 105 ; i
    .byte 109 ; m
    .byte 101 ; e
    .byte 58  ; :
    .byte 32  ; space
    .byte 0

date_sec:
    .byte 32  ; space
    .byte 115 ; s
    .byte 101 ; e
    .byte 99  ; c
    .byte 111 ; o
    .byte 110 ; n
    .byte 100 ; d
    .byte 115 ; s
    .byte 0

date_nl:
    .byte 32  ; space
    .byte 40  ; (
    .byte 51  ; 3
    .byte 54  ; 6
    .byte 48  ; 0
    .byte 48  ; 0
    .byte 47 ; /
    .byte 54  ; 6
    .byte 48  ; 0
    .byte 48  ; 0
    .byte 32  ; space
    .byte 109 ; m
    .byte 97  ; a
    .byte 120 ; x
    .byte 41  ; )
    .byte 0

HALT