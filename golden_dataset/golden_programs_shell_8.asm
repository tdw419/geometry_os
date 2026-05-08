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
    LDI r5, 0
    FILL r5               ; clear screen to black
    LDI r11, 0x1201
    LDI r5, 20
    STORE r11, r5          ; prompt y starts at line 20
    LDI r11, 0x1207
    LDI r5, 0
    STORE r11, r5          ; pipe mode = 0
    LDI r11, 0x1205
    STORE r11, r5          ; redirect mode = 0

    ; Write help text to buffer at 0x1300
    LDI r11, 0x1300
    LDI r5, 104       ; h
    STORE r11, r5
    LDI r11, 0x1301
    LDI r5, 101       ; e
    STORE r11, r5
    LDI r11, 0x1302
    LDI r5, 108       ; l
    STORE r11, r5
    LDI r11, 0x1303
    LDI r5, 112       ; p
    STORE r11, r5
    LDI r11, 0x1304
    LDI r5, 0
    STORE r11, r5

; ═══════════════════════════════════════════════════════════════
; Main loop: display prompt, read command, execute
; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Display prompt "> " at current y position
    LDI r11, 0x1201         ; r11 = prompt y addr
    LOAD r3, r11            ; r3 = y position
    LDI r14, 2              ; x = 2
    LDI r2, prompt_str
    TEXT r14, r3, r2

    ; Read a line of input
    LDI r5, 0x0200         ; buf addr
    LDI r3, 200            ; max len
    LDI r14, 0x1200         ; pos addr
    LDI r11, 0x1200
    LDI r2, 0
    STORE r11, r2           ; reset position

readln_loop:
    READLN r5, r3, r14
    CMP r5, r2             ; r5 == 0 means still reading
    JZ r5, readln_loop

    ; r5 > 0 means line complete (Enter pressed)
    ; Check if line is empty
    JZ r5, main_loop       ; empty line, loop

    ; Parse and execute the command
    CALL parse_command
    CALL execute_command

    ; Scroll down prompt position
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3

    ; If y > 240, scroll screen and reset
    LDI r5, 240
    CMP r3, r5
    BLT r3, main_loop
    LDI r5, 10
    SCROLL r5
    LDI r3, 20
    STORE r11, r3
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_command -- extract command name and argument from input
; Input: command buffer at 0x0200
; Output: command at 0x0400, argument at 0x0600
; Also sets pipe mode (0x1207) and redirect mode (0x1205)
; ═══════════════════════════════════════════════════════════════
parse_command:
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4

    ; Reset pipe mode and redirect mode
    LDI r11, 0x1207
    LDI r5, 0
    STORE r11, r5
    LDI r11, 0x1205
    STORE r11, r5

    ; Skip leading spaces
    LDI r0, 0x0200       ; src pointer
skip_spaces:
    LOAD r5, r0
    JZ r5, parse_done      ; empty string
    LDI r3, 32
    CMP r5, r3
    JZ r5, skip_spaces     ; skip space

    ; Copy command name until space or null
    LDI r15, 0x0400       ; dest for command name
copy_cmd:
    LOAD r5, r0
    JZ r5, parse_cmd_done
    LDI r3, 32
    CMP r5, r3
    JZ r5, parse_cmd_done
    ; Check for pipe character '|' (124)
    LDI r3, 124
    CMP r5, r3
    JZ r5, parse_pipe_found
    ; Check for '>' (62)
    LDI r3, 62
    CMP r5, r3
    JZ r5, parse_redirect_out
    ; Check for '<' (60)
    LDI r3, 60
    CMP r5, r3
    JZ r5, parse_redirect_in
    STORE r15, r5
    ADD r0, r2            ; r2 is still 0 from earlier... let's use r3
    ; Actually need to increment properly
    LDI r3, 1
    ADD r0, r3
    LDI r3, 1
    ADD r15, r3
    JMP copy_cmd

parse_cmd_done:
    ; Null terminate command
    LDI r5, 0
    STORE r15, r5

    ; Skip spaces after command
    LOAD r5, r0
    JZ r5, parse_arg_done  ; no argument
skip_arg_spaces:
    LOAD r5, r0
    LDI r3, 32
    CMP r5, r3
    JZ r5, skip_arg_spaces_inc
    JMP copy_arg_start
skip_arg_spaces_inc:
    LDI r3, 1
    ADD r0, r3
    JMP skip_arg_spaces

copy_arg_start:
    ; Copy argument until null
    LDI r15, 0x0600       ; dest for argument
copy_arg:
    LOAD r5, r0
    JZ r5, parse_arg_done
    ; Check for pipe
    LDI r3, 124
    CMP r5, r3
    JZ r5, parse_pipe_found_arg
    ; Check for redirect
    LDI r3, 62
    CMP r5, r3
    JZ r5, parse_redirect_out_arg
    LDI r3, 60
    CMP r5, r3
    JZ r5, parse_redirect_in_arg
    STORE r15, r5
    LDI r3, 1
    ADD r0, r3
    ADD r15, r3
    JMP copy_arg

parse_arg_done:
    LDI r5, 0
    STORE r15, r5
    JMP parse_done

parse_pipe_found:
    ; Null terminate command
    LDI r5, 0
    STORE r15, r5
    ; Set pipe mode
    LDI r11, 0x1207
    LDI r5, 1
    STORE r11, r5
    ; Skip pipe char and spaces
    LDI r3, 1
    ADD r0, r3
skip_pipe_spaces:
    LOAD r5, r0
    LDI r3, 32
    CMP r5, r3
    JZ r5, skip_pipe_spaces_inc
    JMP copy_pipe_cmd
skip_pipe_spaces_inc:
    LDI r3, 1
    ADD r0, r3
    JMP skip_pipe_spaces

copy_pipe_cmd:
    ; Copy second command to pipe buffer at 0x1400
    LDI r15, 0x1400
copy_pipe_loop:
    LOAD r5, r0
    JZ r5, parse_pipe_done
    STORE r15, r5
    LDI r3, 1
    ADD r0, r3
    ADD r15, r3
    JMP copy_pipe_loop
parse_pipe_done:
    LDI r5, 0
    STORE r15, r5
    JMP parse_done

parse_pipe_found_arg:
    ; Null terminate argument
    LDI r5, 0
    STORE r15, r5
    ; Set pipe mode
    LDI r11, 0x1207
    LDI r5, 1
    STORE r11, r5
    ; Skip pipe char and spaces
    LDI r3, 1
    ADD r0, r3
skip_pipe_spaces2:
    LOAD r5, r0
    LDI r3, 32
    CMP r5, r3
    JZ r5, skip_pipe_spaces2_inc
    JMP copy_pipe_cmd2
skip_pipe_spaces2_inc:
    LDI r3, 1
    ADD r0, r3
    JMP skip_pipe_spaces2

copy_pipe_cmd2:
    LDI r15, 0x1400
copy_pipe_loop2:
    LOAD r5, r0
    JZ r5, parse_done2
    STORE r15, r5
    LDI r3, 1
    ADD r0, r3
    ADD r15, r3
    JMP copy_pipe_loop2
parse_done2:
    LDI r5, 0
    STORE r15, r5
    JMP parse_done

parse_redirect_out:
    ; Null terminate command
    LDI r5, 0
    STORE r15, r5
    ; Check for >> (append)
    LDI r3, 1
    ADD r0, r3
    LOAD r5, r0
    LDI r3, 62
    CMP r5, r3
    JZ r5, redirect_append
    ; Single > = write (mode 1)
    LDI r11, 0x1205
    LDI r5, 1
    STORE r11, r5
    JMP skip_redir_spaces
redirect_append:
    LDI r11, 0x1205
    LDI r5, 2
    STORE r11, r5
    LDI r3, 1
    ADD r0, r3
    JMP skip_redir_spaces

parse_redirect_out_arg:
    ; Null terminate argument
    LDI r5, 0
    STORE r15, r5
    LDI r3, 1
    ADD r0, r3
    LOAD r5, r0
    LDI r3, 62
    CMP r5, r3
    JZ r5, redirect_append2
    LDI r11, 0x1205
    LDI r5, 1
    STORE r11, r5
    JMP skip_redir_spaces
redirect_append2:
    LDI r11, 0x1205
    LDI r5, 2
    STORE r11, r5
    LDI r3, 1
    ADD r0, r3
    JMP skip_redir_spaces

parse_redirect_in:
    LDI r5, 0
    STORE r15, r5
    LDI r11, 0x1205
    LDI r5, 3
    STORE r11, r5
    LDI r3, 1
    ADD r0, r3
    JMP skip_redir_spaces

parse_redirect_in_arg:
    LDI r5, 0
    STORE r15, r5
    LDI r11, 0x1205
    LDI r5, 3
    STORE r11, r5
    LDI r3, 1
    ADD r0, r3
    JMP skip_redir_spaces

skip_redir_spaces:
    LOAD r5, r0
    LDI r3, 32
    CMP r5, r3
    JZ r5, skip_redir_spaces_inc
    JMP copy_redir_file
skip_redir_spaces_inc:
    LDI r3, 1
    ADD r0, r3
    JMP skip_redir_spaces

copy_redir_file:
    ; Copy redirect filename to argument buffer (0x0600)
    LDI r15, 0x0600
copy_redir_loop:
    LOAD r5, r0
    JZ r5, parse_done
    STORE r15, r5
    LDI r3, 1
    ADD r0, r3
    ADD r15, r3
    JMP copy_redir_loop

parse_done:
    POP r4
    POP r6
    POP r15
    POP r0
    RET

; ═══════════════════════════════════════════════════════════════
; execute_command -- dispatch to built-in or EXEC
; Command at 0x0400, argument at 0x0600
; ═══════════════════════════════════════════════════════════════
execute_command:
    PUSH r0
    PUSH r15
    PUSH r6

    ; Check for empty command
    LDI r11, 0x0400
    LOAD r5, r11
    JZ r5, exec_done

    ; Compare command with known built-ins
    ; help
    CALL cmd_is_help
    JNZ r5, do_help

    ; echo
    CALL cmd_is_echo
    JNZ r5, do_echo

    ; ls
    CALL cmd_is_ls
    JNZ r5, do_ls

    ; cat
    CALL cmd_is_cat
    JNZ r5, do_cat

    ; ps
    CALL cmd_is_ps
    JNZ r5, do_ps

    ; kill
    CALL cmd_is_kill
    JNZ r5, do_kill

    ; export
    CALL cmd_is_export
    JNZ r5, do_export

    ; clear
    CALL cmd_is_clear
    JNZ r5, do_clear

    ; rm
    CALL cmd_is_rm
    JNZ r5, do_rm

    ; cp
    CALL cmd_is_cp
    JNZ r5, do_cp

    ; hypervisor
    CALL cmd_is_hypervisor
    JNZ r5, do_hypervisor

    ; edit
    CALL cmd_is_edit
    JNZ r5, do_edit

    ; save
    CALL cmd_is_save
    JNZ r5, do_save

    ; grep
    CALL cmd_is_grep
    JNZ r5, do_grep

    ; head
    CALL cmd_is_head
    JNZ r5, do_head

    ; tail
    CALL cmd_is_tail
    JNZ r5, do_tail

    ; wc
    CALL cmd_is_wc
    JNZ r5, do_wc

    ; date
    CALL cmd_is_date
    JNZ r5, do_date

    ; Not a built-in -- try EXEC
    JMP do_exec

exec_done:
    POP r6
    POP r15
    POP r0
    RET

; ── Command comparison helpers ────────────────────────────────
; Each sets r5=1 if match, r5=0 if not

cmd_is_help:
    LDI r11, 0x0400
    LDI r5, 104       ; h
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cmd_help_n
    LDI r11, 0x0401
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cmd_help_n
    LDI r11, 0x0402
    LDI r5, 108       ; l
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cmd_help_n
    LDI r11, 0x0403
    LDI r5, 112       ; p
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cmd_help_n
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cmd_help_n
    LDI r5, 1
    RET
cmd_help_n:
    LDI r5, 0
    RET

cmd_is_echo:
    LDI r11, 0x0400
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 99        ; c
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 104       ; h
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 111       ; o
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_ls:
    LDI r11, 0x0400
    LDI r5, 108       ; l
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 115       ; s
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_cat:
    LDI r11, 0x0400
    LDI r5, 99        ; c
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 97        ; a
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 116       ; t
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_ps:
    LDI r11, 0x0400
    LDI r5, 112       ; p
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 115       ; s
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_kill:
    LDI r11, 0x0400
    LDI r5, 107       ; k
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 105       ; i
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 108       ; l
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 108       ; l
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_export:
    LDI r11, 0x0400
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 120       ; x
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 112       ; p
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 111       ; o
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 114       ; r
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0405
    LDI r5, 116       ; t
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0406
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_clear:
    LDI r11, 0x0400
    LDI r5, 99        ; c
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 108       ; l
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 97        ; a
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 114       ; r
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0405
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_rm:
    LDI r11, 0x0400
    LDI r5, 114       ; r
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 109       ; m
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_cp:
    LDI r11, 0x0400
    LDI r5, 99        ; c
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 112       ; p
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_hypervisor:
    LDI r11, 0x0400
    LDI r5, 104       ; h
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 121       ; y
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 112       ; p
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 114       ; r
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0405
    LDI r5, 118       ; v
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0406
    LDI r5, 105       ; i
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0407
    LDI r5, 115       ; s
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0408
    LDI r5, 111       ; o
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0409
    LDI r5, 114       ; r
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x040A
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_edit:
    LDI r11, 0x0400
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 100       ; d
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 105       ; i
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 116       ; t
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_save:
    LDI r11, 0x0400
    LDI r5, 115       ; s
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 97        ; a
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 118       ; v
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_grep:
    LDI r11, 0x0400
    LDI r5, 103       ; g
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 114       ; r
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 112       ; p
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_head:
    LDI r11, 0x0400
    LDI r5, 104       ; h
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 97        ; a
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 100       ; d
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_tail:
    LDI r11, 0x0400
    LDI r5, 116       ; t
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 97        ; a
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 105       ; i
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 108       ; l
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_wc:
    LDI r11, 0x0400
    LDI r5, 119       ; w
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 99        ; c
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cmd_is_date:
    LDI r11, 0x0400
    LDI r5, 100       ; d
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0401
    LDI r5, 97        ; a
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0402
    LDI r5, 116       ; t
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0403
    LDI r5, 101       ; e
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r11, 0x0404
    LDI r5, 0
    LOAD r3, r11
    CMP r5, r3
    JNZ r5, cno
    LDI r5, 1
    RET

cno:
    LDI r5, 0
    RET

; ── Built-in command implementations ──────────────────────────

do_help:
    ; Display available commands
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r14, 2
    LDI r2, help_text
    TEXT r14, r3, r2
    JMP exec_done

do_echo:
    ; Print the argument
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x0600
    TEXT r14, r3, r2
    JMP exec_done

do_ls:
    ; List files using LS opcode
    LDI r3, 0x0800
    LS r3                  ; list files into buffer at 0x0800
    ; r5 = number of files
    ; Display each filename
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x0800
    TEXT r14, r3, r2
    JMP exec_done

do_cat:
    ; Read and display a file
    ; Argument (filename) at 0x0600
    LDI r3, 0x0600       ; filename addr
    LDI r14, 0            ; mode = read
    OPEN r3, r14           ; r5 = fd
    ; Check for error
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, exec_done      ; error, skip

    MOV r12, r5            ; save fd in r12
    LDI r2, 0x1000        ; read buffer
    LDI r1, 200           ; max bytes
    READ r12, r2, r1       ; r5 = bytes read
    ; Null terminate
    LDI r8, 200
    CMP r5, r8
    BLT r5, cat_term_ok
    LDI r5, 200
cat_term_ok:
    LDI r8, 0x1000
    ADD r5, r8
    LDI r7, 0
    STORE r5, r7
    ; Display
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x1000
    TEXT r14, r3, r2
    CLOSE r12
    JMP exec_done

do_ps:
    ; Display process info
    ; For now, show PID count and current PID
    GETPID
    MOV r12, r5            ; save our PID
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    ; Show "PID: N" using register value
    ; Write PID as text at 0x1500
    LDI r11, 0x1500
    LDI r5, 80            ; P
    STORE r11, r5
    LDI r11, 0x1501
    LDI r5, 73            ; I
    STORE r11, r5
    LDI r11, 0x1502
    LDI r5, 68            ; D
    STORE r11, r5
    LDI r11, 0x1503
    LDI r5, 58            ; :
    STORE r11, r5
    LDI r11, 0x1504
    LDI r5, 32            ; space
    STORE r11, r5
    ; Convert PID to decimal digits
    LDI r11, 0x1505
    LDI r3, 48            ; '0'
    ADD r5, r3
    STORE r11, r5
    LDI r11, 0x1506
    LDI r5, 0
    STORE r11, r5
    LDI r14, 4
    LDI r2, 0x1500
    TEXT r14, r3, r2
    JMP exec_done

do_kill:
    ; Kill a process by PID
    ; Argument should be a number -- simplified: just echo "kill"
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r2, kill_msg
    LDI r14, 4
    TEXT r14, r3, r2
    JMP exec_done

do_export:
    ; Set environment variable
    ; Argument format: KEY=VALUE
    ; For simplicity, just acknowledge
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r2, export_msg
    LDI r14, 4
    TEXT r14, r3, r2
    JMP exec_done

do_clear:
    LDI r5, 0
    FILL r5
    LDI r11, 0x1201
    LDI r5, 20
    STORE r11, r5
    JMP exec_done

do_rm:
    ; Delete a file: rm <filename>
    ; Argument (filename) at 0x0600
    LDI r11, 0x0600
    LOAD r5, r11
    JZ r5, rm_usage
    ; Copy arg to a clean buffer at 0x1600
    LDI r6, 0x0600
    LDI r15, 0x1600
rm_copy:
    LOAD r5, r6
    JZ r5, rm_copy_done
    STORE r15, r5
    LDI r5, 1
    ADD r6, r5
    ADD r15, r5
    JMP rm_copy
rm_copy_done:
    LDI r5, 0
    STORE r15, r5      ; null terminate
    ; UNLINK r3 where r3 = 0x1600
    LDI r3, 0x1600
    UNLINK r3
    ; r5 = 0 on success, 0xFFFFFFFF on error
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JNZ r5, rm_ok
    ; Print error
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r14, 8          ; "rm: error"
    LDI r2, 0x1700
    ; Store "rm: error" message
    LDI r11, 0x1700
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1701
    LDI r5, 109        ; m
    STORE r11, r5
    LDI r11, 0x1702
    LDI r5, 58         ; :
    STORE r11, r5
    LDI r11, 0x1703
    LDI r5, 32         ; space
    STORE r11, r5
    LDI r11, 0x1704
    LDI r5, 101        ; e
    STORE r11, r5
    LDI r11, 0x1705
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1706
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1707
    LDI r5, 111        ; o
    STORE r11, r5
    LDI r11, 0x1708
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1709
    LDI r5, 0
    STORE r11, r5
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r14, 9
    LDI r2, 0x1700
    TEXT r14, r3, r2
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    JMP exec_done
rm_ok:
    JMP exec_done
rm_usage:
    ; Print "rm <file>"
    LDI r11, 0x1700
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1701
    LDI r5, 109        ; m
    STORE r11, r5
    LDI r11, 0x1702
    LDI r5, 32         ; space
    STORE r11, r5
    LDI r11, 0x1703
    LDI r5, 60         ; <
    STORE r11, r5
    LDI r11, 0x1704
    LDI r5, 102        ; f
    STORE r11, r5
    LDI r11, 0x1705
    LDI r5, 105        ; i
    STORE r11, r5
    LDI r11, 0x1706
    LDI r5, 108        ; l
    STORE r11, r5
    LDI r11, 0x1707
    LDI r5, 101        ; e
    STORE r11, r5
    LDI r11, 0x1708
    LDI r5, 62         ; >
    STORE r11, r5
    LDI r11, 0x1709
    LDI r5, 0
    STORE r11, r5
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r14, 9
    LDI r2, 0x1700
    TEXT r14, r3, r2
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    JMP exec_done

do_cp:
    ; Copy a file: cp <src> <dst>
    ; Arguments at 0x0600, separated by space
    ; Parse second argument from 0x0600 into 0x1800
    LDI r11, 0x0600
    LOAD r5, r11
    JZ r5, cp_usage
    ; Find space separator
    LDI r6, 0x0600
cp_find_space:
    LOAD r5, r6
    JZ r5, cp_usage    ; no space found -- need 2 args
    LDI r3, 32         ; space
    CMP r5, r3
    JZ r5, cp_found_space
    LDI r5, 1
    ADD r6, r5
    JMP cp_find_space
cp_found_space:
    ; Skip the space, copy rest to 0x1800
    LDI r5, 1
    ADD r6, r5
    LDI r15, 0x1800
cp_copy_dst:
    LOAD r5, r6
    JZ r5, cp_copy_dst_done
    STORE r15, r5
    LDI r5, 1
    ADD r6, r5
    ADD r15, r5
    JMP cp_copy_dst
cp_copy_dst_done:
    LDI r5, 0
    STORE r15, r5
    ; Null-terminate the source filename (replace space with 0)
    LDI r6, 0x0600
    LDI r15, 0x1600
cp_copy_src:
    LOAD r5, r6
    JZ r5, cp_src_done
    LDI r3, 32
    CMP r5, r3
    JZ r5, cp_src_terminate
    STORE r15, r5
    LDI r5, 1
    ADD r6, r5
    ADD r15, r5
    JMP cp_copy_src
cp_src_terminate:
    LDI r5, 0
    STORE r15, r5
    JMP cp_do_copy
cp_src_done:
    STORE r15, r5
cp_do_copy:
    ; FCOPY r3, r14 where r3=0x1600 (src), r14=0x1800 (dst)
    LDI r3, 0x1600
    LDI r14, 0x1800
    FCOPY r3, r14
    ; Check result
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JNZ r5, cp_ok
    ; Print error
    LDI r11, 0x1700
    LDI r5, 99         ; c
    STORE r11, r5
    LDI r11, 0x1701
    LDI r5, 112        ; p
    STORE r11, r5
    LDI r11, 0x1702
    LDI r5, 58         ; :
    STORE r11, r5
    LDI r11, 0x1703
    LDI r5, 32         ; space
    STORE r11, r5
    LDI r11, 0x1704
    LDI r5, 101        ; e
    STORE r11, r5
    LDI r11, 0x1705
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1706
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1707
    LDI r5, 111        ; o
    STORE r11, r5
    LDI r11, 0x1708
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1709
    LDI r5, 0
    STORE r11, r5
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r14, 9
    LDI r2, 0x1700
    TEXT r14, r3, r2
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    JMP exec_done
cp_ok:
    JMP exec_done
cp_usage:
    LDI r11, 0x1700
    LDI r5, 99         ; c
    STORE r11, r5
    LDI r11, 0x1701
    LDI r5, 112        ; p
    STORE r11, r5
    LDI r11, 0x1702
    LDI r5, 32         ; space
    STORE r11, r5
    LDI r11, 0x1703
    LDI r5, 60         ; <
    STORE r11, r5
    LDI r11, 0x1704
    LDI r5, 115        ; s
    STORE r11, r5
    LDI r11, 0x1705
    LDI r5, 114        ; r
    STORE r11, r5
    LDI r11, 0x1706
    LDI r5, 99        ; c
    STORE r11, r5
    LDI r11, 0x1707
    LDI r5, 62         ; >
    STORE r11, r5
    LDI r11, 0x1708
    LDI r5, 32         ; space
    STORE r11, r5
    LDI r11, 0x1709
    LDI r5, 60         ; <
    STORE r11, r5
    LDI r11, 0x170A
    LDI r5, 100        ; d
    STORE r11, r5
    LDI r11, 0x170B
    LDI r5, 115        ; s
    STORE r11, r5
    LDI r11, 0x170C
    LDI r5, 116        ; t
    STORE r11, r5
    LDI r11, 0x170D
    LDI r5, 62         ; >
    STORE r11, r5
    LDI r11, 0x170E
    LDI r5, 0
    STORE r11, r5
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r14, 14
    LDI r2, 0x1700
    TEXT r14, r3, r2
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    JMP exec_done

do_hypervisor:
    PUSH r15
    PUSH r6
    ; Check if argument exists
    LDI r11, 0x0600
    LOAD r5, r11
    JZ r5, hypervisor_usage

    ; Copy argument (0x0600) to config buffer (0x1B00)
    LDI r6, 0x0600       ; src
    LDI r15, 0x1B00       ; dst
hypervisor_copy:
    LOAD r5, r6
    JZ r5, hypervisor_copy_done
    STORE r15, r5
    LDI r5, 1
    ADD r6, r5
    ADD r15, r5
    JMP hypervisor_copy
hypervisor_copy_done:
    LDI r5, 0
    STORE r15, r5         ; null terminate

    ; Call HYPERVISOR with config buffer address
    LDI r5, 0x1B00
    HYPERVISOR r5

    ; Check result: 0 = success, 0xFFFFFFFF = error, 0xFFFFFFFD = missing arch
    JZ r5, hypervisor_ok
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, hypervisor_err
    ; Missing arch or other error
    JMP hypervisor_err

hypervisor_ok:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    ; Display "hypervisor started" message
    LDI r14, 4
    LDI r2, hypervisor_ok_msg
    TEXT r14, r3, r2
    JMP hypervisor_done

hypervisor_usage:
    ; No argument -- show usage
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, hypervisor_usage_msg
    TEXT r14, r3, r2
    JMP hypervisor_done

hypervisor_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, hypervisor_err_msg
    TEXT r14, r3, r2
    JMP hypervisor_done

hypervisor_done:
    POP r6
    POP r15
    JMP exec_done

do_edit:
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4

    ; Check for argument
    LDI r11, 0x0600
    LOAD r5, r11
    JZ r5, edit_usage

    ; Open file for reading
    LDI r3, 0x0600       ; filename addr
    LDI r14, 0            ; mode = read
    OPEN r3, r14           ; r5 = fd
    ; Check for error
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, edit_err      ; file not found

    MOV r12, r5            ; save fd in r12

    ; Read file content into buffer at 0x2000
    LDI r2, 0x2000        ; read buffer (8KB, up to row 127 * 32 cols)
    LDI r1, 4096          ; max words to read
    READ r12, r2, r1       ; r5 = bytes read

    ; Close the file
    CLOSE r12

    ; Null terminate at position bytes_read
    LDI r8, 0x2000
    ADD r8, r5            ; r8 = buffer + bytes_read
    LDI r7, 0
    STORE r8, r7          ; null terminator

    ; Display file content on screen, line by line
    ; Each line is up to 32 chars, separated by newline (10) or null
    LDI r13, 0x2000       ; source pointer
    LDI r9, 4            ; y position (start near top)
    LDI r4, 0            ; line buffer index

edit_line_loop:
    LOAD r5, r13
    JZ r5, edit_done      ; null = end of file

    ; Check for newline (10)
    LDI r3, 10
    CMP r5, r3
    JZ r5, edit_newline

    ; Store char in line buffer at 0x2100 + index
    LDI r6, 0x2100
    ADD r6, r4
    STORE r6, r5

    LDI r3, 1
    ADD r13, r3           ; advance source
    ADD r4, r3           ; advance line index

    ; Check if line is 32 chars (screen width at 8px font)
    LDI r3, 32
    CMP r4, r3
    JZ r5, edit_line_full
    JMP edit_line_loop

edit_newline:
    ; Null-terminate current line
    LDI r6, 0x2100
    ADD r6, r4
    LDI r5, 0
    STORE r6, r5

    ; Display line at y position
    LDI r14, 4             ; x = 4
    LDI r2, 0x2100        ; line buffer
    TEXT r14, r9, r2      ; render text at (4, y)

    ; Advance to next line
    LDI r3, 1
    ADD r13, r3           ; skip the newline char
    ADD r9, r3           ; next y position
    LDI r4, 0            ; reset line buffer index
    JMP edit_line_loop

edit_line_full:
    ; Null-terminate
    LDI r6, 0x2100
    ADD r6, r4
    LDI r5, 0
    STORE r6, r5

    ; Display line
    LDI r14, 4
    LDI r2, 0x2100
    TEXT r14, r9, r2

    ; Next line (no source advance since char was already stored)
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    LDI r4, 0
    JMP edit_line_loop

edit_done:
    ; Null-terminate last line if there's content
    JZ r4, edit_show_msg
    LDI r6, 0x2100
    ADD r6, r4
    LDI r5, 0
    STORE r6, r5
    LDI r14, 4
    LDI r2, 0x2100
    TEXT r14, r9, r2

edit_show_msg:
    ; Show "[edit: filename]" at bottom
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, edit_ok_msg
    TEXT r14, r3, r2
    JMP edit_cleanup

edit_usage:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, edit_usage_msg
    TEXT r14, r3, r2
    JMP edit_cleanup

edit_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, edit_err_msg
    TEXT r14, r3, r2

edit_cleanup:
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

do_save:
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4

    ; Check for argument
    LDI r11, 0x0600
    LOAD r5, r11
    JZ r5, save_usage

    ; Open file for writing (mode 1 = write/create)
    LDI r3, 0x0600       ; filename addr
    LDI r14, 1            ; mode = write
    OPEN r3, r14           ; r5 = fd
    ; Check for error
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, save_err      ; could not create file

    MOV r12, r5            ; save fd in r12

    ; Calculate content length from edit buffer at 0x2000
    ; Scan for null terminator
    LDI r13, 0x2000
    LDI r9, 0            ; length counter
save_scan:
    LOAD r5, r13
    JZ r5, save_scan_done
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    JMP save_scan

save_scan_done:
    ; If nothing to save, show message
    JZ r9, save_empty

    ; Write content to file
    LDI r3, 0x2000        ; buffer addr
    MOV r14, r3             ; fd_reg = r12 already
    ; WRITE fd_reg, buf_reg, len_reg
    MOV r3, r12             ; r3 = fd
    LDI r14, 0x2000         ; buf addr
    MOV r2, r9            ; length
    WRITE r3, r14, r2       ; r5 = bytes written

    CLOSE r12               ; close file

    ; Show "[saved: N bytes]" message
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, save_ok_msg
    TEXT r14, r3, r2
    JMP save_cleanup

save_empty:
    CLOSE r12
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, save_empty_msg
    TEXT r14, r3, r2
    JMP save_cleanup

save_usage:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, save_usage_msg
    TEXT r14, r3, r2
    JMP save_cleanup

save_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, save_err_msg
    TEXT r14, r3, r2

save_cleanup:
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

do_grep:
    ; grep <pattern> <file> -- search file for lines containing pattern
    ; Argument at 0x0600 is "pattern file"
    ; We need to split: first word = pattern, second word = filename
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4
    PUSH r9
    PUSH r13

    ; Parse argument: find first space to split pattern from filename
    ; Store pattern at 0x2200, filename at 0x2300
    LDI r13, 0x0600      ; arg pointer
    LDI r9, 0x2200      ; pattern buffer
    LDI r4, 0           ; pattern length

grep_parse_pat:
    LOAD r5, r13
    JZ r5, grep_no_file   ; no space found, error
    LDI r3, 32            ; space
    CMP r5, r3
    JZ r5, grep_copy_file
    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    ADD r4, r3
    JMP grep_parse_pat

grep_copy_file:
    ; Skip the space
    LDI r3, 1
    ADD r13, r3
    ; Copy filename to 0x2300
    LDI r9, 0x2300

grep_copy_file_loop:
    LOAD r5, r13
    JZ r5, grep_have_file
    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    JMP grep_copy_file_loop

grep_have_file:
    LDI r5, 0
    STORE r9, r5         ; null terminate filename
    ; Null terminate pattern
    LDI r9, 0x2200
    ADD r9, r4
    STORE r9, r5

    ; Check pattern length > 0
    JZ r4, grep_err

    ; Open file
    LDI r3, 0x2300       ; filename addr
    LDI r14, 0            ; mode = read
    OPEN r3, r14           ; r5 = fd
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, grep_err

    MOV r12, r5            ; save fd

    ; Read file content into 0x2000
    LDI r2, 0x2000
    LDI r1, 400           ; max bytes to read
    READ r12, r2, r1
    CLOSE r12

    ; Null terminate at read position
    LDI r8, 0x2000
    ADD r8, r5
    LDI r7, 0
    STORE r8, r7

    ; Scan file line by line, check if each line contains the pattern
    ; Line buffer at 0x2400, max 64 chars
    ; Save file pointer at 0x2380 (pattern_len * 4 + pattern_buf end)
    ; Actually, save at 0x23FF (safe scratch)
    LDI r13, 0x2000       ; file pointer
    LDI r6, 0            ; match count

grep_line_loop:
    ; Save file pointer to scratch
    MOV r10, r13           ; r10 = saved file ptr

    LOAD r5, r13
    JZ r5, grep_done       ; end of file

    ; Copy line to buffer at 0x2400, track length
    LDI r9, 0x2400
    LDI r4, 0            ; line length

grep_copy_line:
    LOAD r5, r13
    JZ r5, grep_check_line     ; end of file, check this line
    LDI r3, 10                 ; newline
    CMP r5, r3
    JZ r5, grep_advance_nl
    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    ADD r4, r3
    LDI r3, 64
    CMP r4, r3
    JZ r5, grep_check_line
    JMP grep_copy_line

grep_advance_nl:
    LDI r3, 1
    ADD r13, r3             ; skip newline

grep_check_line:
    ; Null terminate line buffer
    LDI r5, 0
    STORE r9, r5

    ; Compute pattern length (scan 0x2200 for null)
    LDI r15, 0
    LDI r0, 0x2200

grep_scan_pat_len:
    LOAD r5, r0
    JZ r5, grep_have_pat_len
    LDI r3, 1
    ADD r0, r3
    ADD r15, r3
    JMP grep_scan_pat_len

grep_have_pat_len:
    ; r15 = pattern length, r4 = line length
    ; Skip if line shorter than pattern
    CMP r4, r15
    BLT r5, grep_next_line

    ; Simple substring search: check each starting position
    ; r4 - r15 = max starting position
    SUB r4, r15           ; r4 = max_start (line_len - pat_len)

grep_search_pos:
    ; r9 = current position in line (0x2400 + offset)
    ; Use offset tracking instead of absolute address comparison
    LDI r11, 0              ; search offset

grep_search_pos2:
    CMP r11, r4            ; offset vs max_start
    BGE r5, grep_next_line

    ; Compare pattern with line at offset r11
    LDI r0, 0x2400
    ADD r0, r11            ; r0 = line_base + offset
    LDI r6, 0x2200        ; pattern start
    LDI r3, 0              ; chars matched

grep_cmp_loop:
    LOAD r5, r0
    LOAD r14, r6
    CMP r5, r14
    JNZ r5, grep_no_match_here
    ; Match so far
    LDI r2, 1
    ADD r0, r2
    ADD r6, r2
    ADD r3, r2             ; count matched chars
    CMP r3, r15            ; matched vs pattern_len
    BLT r5, grep_cmp_loop
    JMP grep_found_match

grep_no_match_here:
    LDI r2, 1
    ADD r11, r2             ; advance offset
    JMP grep_search_pos2

grep_found_match:
    ; Display the matching line
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x2400
    TEXT r14, r3, r2

grep_next_line:
    ; Restore file pointer from r10
    MOV r13, r10
    JMP grep_line_loop

grep_no_file:
    ; Missing filename argument
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, grep_usage
    TEXT r14, r3, r2
    JMP grep_cleanup

grep_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, grep_err_msg
    TEXT r14, r3, r2
    JMP grep_cleanup

grep_done:
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

grep_cleanup:
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

do_head:
    ; head <file> [N] -- display first N lines (default 10)
    ; Argument at 0x0600 is "file N"
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4
    PUSH r9
    PUSH r13

    ; Parse: filename at 0x0600, optional number after space
    ; Copy filename to 0x2200, check for trailing number
    LDI r13, 0x0600
    LDI r9, 0x2200

head_copy_name:
    LOAD r5, r13
    JZ r5, head_name_done
    LDI r3, 32
    CMP r5, r3
    JZ r5, head_parse_n
    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    JMP head_copy_name

head_parse_n:
    ; Skip space
    LDI r3, 1
    ADD r13, r3
    ; Parse number (single digit 1-9 for simplicity)
    LDI r15, 10           ; default N = 10
    LOAD r5, r13
    JZ r5, head_name_done  ; no number, use default
    ; Subtract '0' (48) to get digit
    LDI r3, 48
    SUB r5, r3
    ; If result is 1-9, use it; else default 10
    LDI r3, 1
    CMP r5, r3
    BLT r5, head_name_done
    LDI r3, 9
    CMP r5, r3
    BGE r5, head_name_done
    MOV r15, r5           ; use parsed N

head_name_done:
    LDI r5, 0
    STORE r9, r5         ; null terminate filename

    ; Check for empty filename
    LDI r9, 0x2200
    LOAD r5, r9
    JZ r5, head_err

    ; Open file
    LDI r3, 0x2200
    LDI r14, 0
    OPEN r3, r14
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, head_err

    MOV r12, r5
    LDI r2, 0x2000
    LDI r1, 400
    READ r12, r2, r1
    CLOSE r12

    ; Null terminate
    LDI r8, 0x2000
    ADD r8, r5
    LDI r7, 0
    STORE r8, r7

    ; Display first N lines
    LDI r13, 0x2000       ; file pointer
    LDI r9, 0x2400       ; line buffer
    LDI r6, 0            ; line count
    LDI r4, 0            ; chars in line

head_read_line:
    LOAD r5, r13
    JZ r5, head_done      ; end of file

    LDI r3, 10
    CMP r5, r3
    JZ r5, head_print_line

    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    ADD r4, r3
    LDI r3, 32
    CMP r4, r3
    BLT r5, head_read_line
    ; Line too long, print what we have
    JMP head_print_line

head_print_line:
    ; Null terminate
    LDI r5, 0
    STORE r9, r5
    ; Display
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x2400
    TEXT r14, r3, r2

    ; Increment line count, check limit
    LDI r3, 1
    ADD r6, r3
    CMP r6, r15
    BGE r5, head_done

    ; Skip newline if present
    LOAD r5, r13
    LDI r3, 10
    CMP r5, r3
    JZ r5, head_skip_nl
    JMP head_reset_line

head_skip_nl:
    LDI r3, 1
    ADD r13, r3

head_reset_line:
    LDI r9, 0x2400
    LDI r4, 0
    JMP head_read_line

head_done:
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

head_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, head_usage_msg
    TEXT r14, r3, r2
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

do_tail:
    ; tail <file> [N] -- display last N lines (default 10)
    ; Strategy: read whole file, count newlines, display last N
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4
    PUSH r9
    PUSH r13

    ; Parse: filename at 0x0600, optional number
    LDI r13, 0x0600
    LDI r9, 0x2200

tail_copy_name:
    LOAD r5, r13
    JZ r5, tail_name_done
    LDI r3, 32
    CMP r5, r3
    JZ r5, tail_parse_n
    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    JMP tail_copy_name

tail_parse_n:
    LDI r3, 1
    ADD r13, r3
    LDI r15, 10           ; default N = 10
    LOAD r5, r13
    JZ r5, tail_name_done
    LDI r3, 48
    SUB r5, r3
    LDI r3, 1
    CMP r5, r3
    BLT r5, tail_name_done
    LDI r3, 9
    CMP r5, r3
    BGE r5, tail_name_done
    MOV r15, r5

tail_name_done:
    LDI r5, 0
    STORE r9, r5

    LDI r9, 0x2200
    LOAD r5, r9
    JZ r5, tail_err

    ; Open and read file
    LDI r3, 0x2200
    LDI r14, 0
    OPEN r3, r14
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, tail_err

    MOV r12, r5
    LDI r2, 0x2000
    LDI r1, 400
    READ r12, r2, r1
    CLOSE r12

    LDI r8, 0x2000
    ADD r8, r5
    LDI r7, 0
    STORE r8, r7

    ; Count total lines
    LDI r13, 0x2000
    LDI r6, 1            ; line count (at least 1)

tail_count_lines:
    LOAD r5, r13
    JZ r5, tail_count_done
    LDI r3, 10
    CMP r5, r3
    JNZ r5, tail_count_next
    LDI r3, 1
    ADD r6, r3           ; increment line count
tail_count_next:
    LDI r3, 1
    ADD r13, r3
    JMP tail_count_lines

tail_count_done:
    ; Compute start line: total_lines - N (but min 1)
    MOV r9, r6           ; total_lines
    SUB r9, r15           ; total - N
    LDI r3, 1
    CMP r9, r3
    BGE r5, tail_skip_ok
    MOV r9, r3            ; at least line 1

tail_skip_ok:
    ; Skip to start line
    LDI r13, 0x2000
    LDI r6, 1             ; current line

tail_skip_loop:
    CMP r6, r9
    BGE r5, tail_display   ; reached start line

tail_skip_next:
    LOAD r5, r13
    JZ r5, tail_done       ; end of file
    LDI r3, 10
    CMP r5, r3
    JNZ r5, tail_skip_adv
    LDI r3, 1
    ADD r6, r3            ; next line on newline
tail_skip_adv:
    LDI r3, 1
    ADD r13, r3
    JMP tail_skip_loop

tail_display:
    ; Display remaining lines
    LDI r9, 0x2400       ; line buffer
    LDI r4, 0            ; chars in line

tail_read_char:
    LOAD r5, r13
    JZ r5, tail_flush
    LDI r3, 10
    CMP r5, r3
    JZ r5, tail_flush

    STORE r9, r5
    LDI r3, 1
    ADD r13, r3
    ADD r9, r3
    ADD r4, r3
    LDI r3, 32
    CMP r4, r3
    BLT r5, tail_read_char
    JMP tail_flush

tail_flush:
    LDI r5, 0
    STORE r9, r5
    ; Display line
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x2400
    TEXT r14, r3, r2

    ; Check if we consumed a newline
    LOAD r5, r13
    LDI r3, 10
    CMP r5, r3
    JZ r5, tail_skip_newline

tail_reset:
    LDI r9, 0x2400
    LDI r4, 0
    LOAD r5, r13
    JZ r5, tail_done
    JMP tail_read_char

tail_skip_newline:
    LDI r3, 1
    ADD r13, r3
    JMP tail_reset

tail_done:
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

tail_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, tail_usage_msg
    TEXT r14, r3, r2
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

do_wc:
    ; wc <file> -- count lines, words, and bytes
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4
    PUSH r9
    PUSH r13

    ; Check for argument
    LDI r11, 0x0600
    LOAD r5, r11
    JZ r5, wc_err

    ; Open file
    LDI r3, 0x0600
    LDI r14, 0
    OPEN r3, r14
    LDI r3, 0xFFFFFFFF
    CMP r5, r3
    JZ r5, wc_err

    MOV r12, r5
    LDI r2, 0x2000
    LDI r1, 400
    READ r12, r2, r1
    MOV r4, r5           ; save byte count
    CLOSE r12

    ; Null terminate
    LDI r8, 0x2000
    ADD r8, r5
    LDI r7, 0
    STORE r8, r7

    ; Count lines and words
    LDI r13, 0x2000       ; file pointer
    LDI r6, 0            ; line count
    LDI r15, 0            ; word count
    LDI r0, 0            ; prev was space (1=yes, 0=no)

wc_scan:
    LOAD r5, r13
    JZ r5, wc_format      ; end of file

    ; Count newlines
    LDI r3, 10
    CMP r5, r3
    JNZ r5, wc_not_nl
    LDI r3, 1
    ADD r6, r3           ; line++
    LDI r0, 1            ; prev = space
    JMP wc_next

wc_not_nl:
    ; Count words: space or other whitespace transitions
    LDI r3, 32            ; space
    CMP r5, r3
    JNZ r5, wc_not_space
    LDI r0, 1            ; prev = space
    JMP wc_next

wc_not_space:
    ; If prev was space and current is not, it is a new word
    LDI r3, 1
    CMP r0, r3
    JNZ r5, wc_next
    ADD r15, r3           ; word++
    LDI r0, 0            ; prev = not space

wc_next:
    LDI r3, 1
    ADD r13, r3
    JMP wc_scan

wc_format:
    ; Build output string at 0x2400: "N N N"
    ; Format: lines words bytes
    LDI r9, 0x2400

    ; Convert lines (r6) to decimal
    CALL wc_utoa
    ; Add space
    LDI r5, 32
    STORE r9, r5
    LDI r3, 1
    ADD r9, r3

    ; Convert words (r15) to decimal
    MOV r13, r15
    CALL wc_utoa
    ; Add space
    LDI r5, 32
    STORE r9, r5
    LDI r3, 1
    ADD r9, r3

    ; Convert bytes (r4) to decimal
    MOV r13, r4
    CALL wc_utoa
    ; Null terminate
    LDI r5, 0
    STORE r9, r5

    ; Display
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x2400
    TEXT r14, r3, r2
    JMP wc_cleanup

wc_utoa:
    ; Convert r13 to decimal, write to buffer at r9
    ; Modifies r13, does not change r9 (caller manages it)
    PUSH r0
    ; Handle 0 case
    JNZ r13, wc_utoa_nonzero
    LDI r5, 48            ; '0'
    STORE r9, r5
    LDI r3, 1
    ADD r9, r3
    POP r0
    RET

wc_utoa_nonzero:
    ; Find number of digits by repeated division
    LDI r0, 0            ; digit count
    LDI r6, 10
    MOV r15, r13          ; temp copy

wc_count_digits:
    JZ r15, wc_do_digits
    LDI r3, 10
    DIV r15, r3
    LDI r3, 1
    ADD r0, r3
    JMP wc_count_digits

wc_do_digits:
    ; r0 = digit count. We need to write digits from most significant.
    ; Write digits to a temp area at 0x2500, then copy in order.
    LDI r6, 0x2500       ; temp digit buffer
    LDI r15, 0            ; digit index
    MOV r13, r15          ; restore original? No, r13 was modified.
    ; Actually we need to re-do the conversion. Let me use a simpler approach:
    ; Write digits in reverse order, then reverse them.
    ; Even simpler: since max bytes ~400, max 3 digits. Handle up to 999.
    POP r0
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4

    ; Save r9 (output pointer)
    MOV r4, r9

    ; Write digits in reverse at 0x2500
    LDI r6, 0x2500
    LDI r15, 0            ; digit count

wc_div_loop:
    JZ r13, wc_rev_digits
    LDI r3, 10
    DIV r13, r3
    LDI r3, 48            ; '0'
    ADD r5, r3            ; r5 = digit char
    STORE r6, r5
    LDI r3, 1
    ADD r6, r3
    ADD r15, r3
    JMP wc_div_loop

wc_rev_digits:
    ; r15 = digit count at 0x2500 (reversed)
    ; Copy in reverse order to output
    JZ r15, wc_utoa_done
    LDI r3, 1
    SUB r15, r3
    LDI r6, 0x2500
    ADD r6, r15
    LOAD r5, r6
    STORE r4, r5
    LDI r3, 1
    ADD r4, r3
    JMP wc_rev_digits

wc_utoa_done:
    MOV r9, r4          ; update output pointer
    POP r4
    POP r6
    POP r15
    POP r0
    POP r0
    RET

wc_err:
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, wc_usage_msg
    TEXT r14, r3, r2
wc_cleanup:
    POP r13
    POP r9
    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

do_date:
    ; Display ticks since boot (proxy for uptime)
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4

    ; Read TICKS from RAM[0xFFE]
    LDI r11, 0xFFE
    LOAD r13, r11           ; r13 = ticks

    ; Build output: "ticks: NNNN" at 0x2400
    LDI r9, 0x2400
    ; Write "ticks: "
    LDI r5, 116           ; t
    STORE r9, r5
    LDI r3, 1
    ADD r9, r3
    LDI r5, 105           ; i
    STORE r9, r5
    ADD r9, r3
    LDI r5, 99            ; c
    STORE r9, r5
    ADD r9, r3
    LDI r5, 107           ; k
    STORE r9, r5
    ADD r9, r3
    LDI r5, 115           ; s
    STORE r9, r5
    ADD r9, r3
    LDI r5, 58            ; :
    STORE r9, r5
    ADD r9, r3
    LDI r5, 32            ; space
    STORE r9, r5
    ADD r9, r3

    ; Convert ticks to decimal
    CALL date_utoa

    ; Null terminate
    LDI r5, 0
    STORE r9, r5

    ; Display
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r14, 4
    LDI r2, 0x2400
    TEXT r14, r3, r2

    POP r4
    POP r6
    POP r15
    POP r0
    JMP exec_done

date_utoa:
    ; Convert r13 to decimal, write to buffer at r9
    PUSH r0
    PUSH r15
    PUSH r6
    PUSH r4

    MOV r4, r9

    ; Handle 0
    JNZ r13, date_nonzero
    LDI r5, 48
    STORE r9, r5
    LDI r3, 1
    ADD r9, r3
    POP r4
    POP r6
    POP r15
    POP r0
    RET

date_nonzero:
    ; Write digits in reverse at 0x2600
    LDI r6, 0x2600
    LDI r15, 0

date_div:
    JZ r13, date_rev
    LDI r3, 10
    DIV r13, r3
    LDI r3, 48
    ADD r5, r3
    STORE r6, r5
    LDI r3, 1
    ADD r6, r3
    ADD r15, r3
    JMP date_div

date_rev:
    JZ r15, date_done
    LDI r3, 1
    SUB r15, r3
    LDI r6, 0x2600
    ADD r6, r15
    LOAD r5, r6
    STORE r4, r5
    LDI r3, 1
    ADD r4, r3
    JMP date_rev

date_done:
    MOV r9, r4
    POP r4
    POP r6
    POP r15
    POP r0
    RET

do_exec:
    ; Execute external program via EXEC
    ; Command name at 0x0400
    LDI r3, 0x0400
    EXEC r3               ; r5 = PID or error
    ; Check for error
    LDI r14, 0xFFFFFFFF
    CMP r5, r14
    JZ r5, exec_error

    ; Save PID
    LDI r11, 0x1202
    STORE r11, r5

    ; Wait for child to complete
exec_wait:
    LDI r3, 0x1202
    LOAD r3, r11
    WAITPID r3
    JZ r5, exec_wait     ; still running

    ; Check for pipe mode
    LDI r11, 0x1207
    LOAD r5, r11
    LDI r3, 1
    CMP r5, r3
    JZ r5, exec_pipe

    JMP exec_done

exec_pipe:
    ; Execute second command from pipe buffer
    LDI r3, 0x1400
    EXEC r3
    LDI r11, 0x1202
    STORE r11, r5
exec_pipe_wait:
    LDI r3, 0x1202
    LOAD r3, r11
    WAITPID r3
    JZ r5, exec_pipe_wait
    JMP exec_done

exec_error:
    ; Display "command not found"
    LDI r11, 0x1201
    LOAD r3, r11
    LDI r5, 12
    ADD r3, r5
    STORE r11, r3
    LDI r2, not_found_msg
    LDI r14, 4
    TEXT r14, r3, r2
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