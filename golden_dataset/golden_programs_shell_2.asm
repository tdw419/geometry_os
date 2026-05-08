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
    LDI r0, 0
    FILL r0               ; clear screen to black
    LDI r7, 0x1201
    LDI r0, 20
    STORE r7, r0          ; prompt y starts at line 20
    LDI r7, 0x1207
    LDI r0, 0
    STORE r7, r0          ; pipe mode = 0
    LDI r7, 0x1205
    STORE r7, r0          ; redirect mode = 0

    ; Write help text to buffer at 0x1300
    LDI r7, 0x1300
    LDI r0, 104       ; h
    STORE r7, r0
    LDI r7, 0x1301
    LDI r0, 101       ; e
    STORE r7, r0
    LDI r7, 0x1302
    LDI r0, 108       ; l
    STORE r7, r0
    LDI r7, 0x1303
    LDI r0, 112       ; p
    STORE r7, r0
    LDI r7, 0x1304
    LDI r0, 0
    STORE r7, r0

; ═══════════════════════════════════════════════════════════════
; Main loop: display prompt, read command, execute
; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Display prompt "> " at current y position
    LDI r7, 0x1201         ; r7 = prompt y addr
    LOAD r6, r7            ; r6 = y position
    LDI r1, 2              ; x = 2
    LDI r12, prompt_str
    TEXT r1, r6, r12

    ; Read a line of input
    LDI r0, 0x0200         ; buf addr
    LDI r6, 200            ; max len
    LDI r1, 0x1200         ; pos addr
    LDI r7, 0x1200
    LDI r12, 0
    STORE r7, r12           ; reset position

readln_loop:
    READLN r0, r6, r1
    CMP r0, r12             ; r0 == 0 means still reading
    JZ r0, readln_loop

    ; r0 > 0 means line complete (Enter pressed)
    ; Check if line is empty
    JZ r0, main_loop       ; empty line, loop

    ; Parse and execute the command
    CALL parse_command
    CALL execute_command

    ; Scroll down prompt position
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6

    ; If y > 240, scroll screen and reset
    LDI r0, 240
    CMP r6, r0
    BLT r6, main_loop
    LDI r0, 10
    SCROLL r0
    LDI r6, 20
    STORE r7, r6
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_command -- extract command name and argument from input
; Input: command buffer at 0x0200
; Output: command at 0x0400, argument at 0x0600
; Also sets pipe mode (0x1207) and redirect mode (0x1205)
; ═══════════════════════════════════════════════════════════════
parse_command:
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3

    ; Reset pipe mode and redirect mode
    LDI r7, 0x1207
    LDI r0, 0
    STORE r7, r0
    LDI r7, 0x1205
    STORE r7, r0

    ; Skip leading spaces
    LDI r10, 0x0200       ; src pointer
skip_spaces:
    LOAD r0, r10
    JZ r0, parse_done      ; empty string
    LDI r6, 32
    CMP r0, r6
    JZ r0, skip_spaces     ; skip space

    ; Copy command name until space or null
    LDI r5, 0x0400       ; dest for command name
copy_cmd:
    LOAD r0, r10
    JZ r0, parse_cmd_done
    LDI r6, 32
    CMP r0, r6
    JZ r0, parse_cmd_done
    ; Check for pipe character '|' (124)
    LDI r6, 124
    CMP r0, r6
    JZ r0, parse_pipe_found
    ; Check for '>' (62)
    LDI r6, 62
    CMP r0, r6
    JZ r0, parse_redirect_out
    ; Check for '<' (60)
    LDI r6, 60
    CMP r0, r6
    JZ r0, parse_redirect_in
    STORE r5, r0
    ADD r10, r12            ; r12 is still 0 from earlier... let's use r6
    ; Actually need to increment properly
    LDI r6, 1
    ADD r10, r6
    LDI r6, 1
    ADD r5, r6
    JMP copy_cmd

parse_cmd_done:
    ; Null terminate command
    LDI r0, 0
    STORE r5, r0

    ; Skip spaces after command
    LOAD r0, r10
    JZ r0, parse_arg_done  ; no argument
skip_arg_spaces:
    LOAD r0, r10
    LDI r6, 32
    CMP r0, r6
    JZ r0, skip_arg_spaces_inc
    JMP copy_arg_start
skip_arg_spaces_inc:
    LDI r6, 1
    ADD r10, r6
    JMP skip_arg_spaces

copy_arg_start:
    ; Copy argument until null
    LDI r5, 0x0600       ; dest for argument
copy_arg:
    LOAD r0, r10
    JZ r0, parse_arg_done
    ; Check for pipe
    LDI r6, 124
    CMP r0, r6
    JZ r0, parse_pipe_found_arg
    ; Check for redirect
    LDI r6, 62
    CMP r0, r6
    JZ r0, parse_redirect_out_arg
    LDI r6, 60
    CMP r0, r6
    JZ r0, parse_redirect_in_arg
    STORE r5, r0
    LDI r6, 1
    ADD r10, r6
    ADD r5, r6
    JMP copy_arg

parse_arg_done:
    LDI r0, 0
    STORE r5, r0
    JMP parse_done

parse_pipe_found:
    ; Null terminate command
    LDI r0, 0
    STORE r5, r0
    ; Set pipe mode
    LDI r7, 0x1207
    LDI r0, 1
    STORE r7, r0
    ; Skip pipe char and spaces
    LDI r6, 1
    ADD r10, r6
skip_pipe_spaces:
    LOAD r0, r10
    LDI r6, 32
    CMP r0, r6
    JZ r0, skip_pipe_spaces_inc
    JMP copy_pipe_cmd
skip_pipe_spaces_inc:
    LDI r6, 1
    ADD r10, r6
    JMP skip_pipe_spaces

copy_pipe_cmd:
    ; Copy second command to pipe buffer at 0x1400
    LDI r5, 0x1400
copy_pipe_loop:
    LOAD r0, r10
    JZ r0, parse_pipe_done
    STORE r5, r0
    LDI r6, 1
    ADD r10, r6
    ADD r5, r6
    JMP copy_pipe_loop
parse_pipe_done:
    LDI r0, 0
    STORE r5, r0
    JMP parse_done

parse_pipe_found_arg:
    ; Null terminate argument
    LDI r0, 0
    STORE r5, r0
    ; Set pipe mode
    LDI r7, 0x1207
    LDI r0, 1
    STORE r7, r0
    ; Skip pipe char and spaces
    LDI r6, 1
    ADD r10, r6
skip_pipe_spaces2:
    LOAD r0, r10
    LDI r6, 32
    CMP r0, r6
    JZ r0, skip_pipe_spaces2_inc
    JMP copy_pipe_cmd2
skip_pipe_spaces2_inc:
    LDI r6, 1
    ADD r10, r6
    JMP skip_pipe_spaces2

copy_pipe_cmd2:
    LDI r5, 0x1400
copy_pipe_loop2:
    LOAD r0, r10
    JZ r0, parse_done2
    STORE r5, r0
    LDI r6, 1
    ADD r10, r6
    ADD r5, r6
    JMP copy_pipe_loop2
parse_done2:
    LDI r0, 0
    STORE r5, r0
    JMP parse_done

parse_redirect_out:
    ; Null terminate command
    LDI r0, 0
    STORE r5, r0
    ; Check for >> (append)
    LDI r6, 1
    ADD r10, r6
    LOAD r0, r10
    LDI r6, 62
    CMP r0, r6
    JZ r0, redirect_append
    ; Single > = write (mode 1)
    LDI r7, 0x1205
    LDI r0, 1
    STORE r7, r0
    JMP skip_redir_spaces
redirect_append:
    LDI r7, 0x1205
    LDI r0, 2
    STORE r7, r0
    LDI r6, 1
    ADD r10, r6
    JMP skip_redir_spaces

parse_redirect_out_arg:
    ; Null terminate argument
    LDI r0, 0
    STORE r5, r0
    LDI r6, 1
    ADD r10, r6
    LOAD r0, r10
    LDI r6, 62
    CMP r0, r6
    JZ r0, redirect_append2
    LDI r7, 0x1205
    LDI r0, 1
    STORE r7, r0
    JMP skip_redir_spaces
redirect_append2:
    LDI r7, 0x1205
    LDI r0, 2
    STORE r7, r0
    LDI r6, 1
    ADD r10, r6
    JMP skip_redir_spaces

parse_redirect_in:
    LDI r0, 0
    STORE r5, r0
    LDI r7, 0x1205
    LDI r0, 3
    STORE r7, r0
    LDI r6, 1
    ADD r10, r6
    JMP skip_redir_spaces

parse_redirect_in_arg:
    LDI r0, 0
    STORE r5, r0
    LDI r7, 0x1205
    LDI r0, 3
    STORE r7, r0
    LDI r6, 1
    ADD r10, r6
    JMP skip_redir_spaces

skip_redir_spaces:
    LOAD r0, r10
    LDI r6, 32
    CMP r0, r6
    JZ r0, skip_redir_spaces_inc
    JMP copy_redir_file
skip_redir_spaces_inc:
    LDI r6, 1
    ADD r10, r6
    JMP skip_redir_spaces

copy_redir_file:
    ; Copy redirect filename to argument buffer (0x0600)
    LDI r5, 0x0600
copy_redir_loop:
    LOAD r0, r10
    JZ r0, parse_done
    STORE r5, r0
    LDI r6, 1
    ADD r10, r6
    ADD r5, r6
    JMP copy_redir_loop

parse_done:
    POP r3
    POP r14
    POP r5
    POP r10
    RET

; ═══════════════════════════════════════════════════════════════
; execute_command -- dispatch to built-in or EXEC
; Command at 0x0400, argument at 0x0600
; ═══════════════════════════════════════════════════════════════
execute_command:
    PUSH r10
    PUSH r5
    PUSH r14

    ; Check for empty command
    LDI r7, 0x0400
    LOAD r0, r7
    JZ r0, exec_done

    ; Compare command with known built-ins
    ; help
    CALL cmd_is_help
    JNZ r0, do_help

    ; echo
    CALL cmd_is_echo
    JNZ r0, do_echo

    ; ls
    CALL cmd_is_ls
    JNZ r0, do_ls

    ; cat
    CALL cmd_is_cat
    JNZ r0, do_cat

    ; ps
    CALL cmd_is_ps
    JNZ r0, do_ps

    ; kill
    CALL cmd_is_kill
    JNZ r0, do_kill

    ; export
    CALL cmd_is_export
    JNZ r0, do_export

    ; clear
    CALL cmd_is_clear
    JNZ r0, do_clear

    ; rm
    CALL cmd_is_rm
    JNZ r0, do_rm

    ; cp
    CALL cmd_is_cp
    JNZ r0, do_cp

    ; hypervisor
    CALL cmd_is_hypervisor
    JNZ r0, do_hypervisor

    ; edit
    CALL cmd_is_edit
    JNZ r0, do_edit

    ; save
    CALL cmd_is_save
    JNZ r0, do_save

    ; grep
    CALL cmd_is_grep
    JNZ r0, do_grep

    ; head
    CALL cmd_is_head
    JNZ r0, do_head

    ; tail
    CALL cmd_is_tail
    JNZ r0, do_tail

    ; wc
    CALL cmd_is_wc
    JNZ r0, do_wc

    ; date
    CALL cmd_is_date
    JNZ r0, do_date

    ; Not a built-in -- try EXEC
    JMP do_exec

exec_done:
    POP r14
    POP r5
    POP r10
    RET

; ── Command comparison helpers ────────────────────────────────
; Each sets r0=1 if match, r0=0 if not

cmd_is_help:
    LDI r7, 0x0400
    LDI r0, 104       ; h
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cmd_help_n
    LDI r7, 0x0401
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cmd_help_n
    LDI r7, 0x0402
    LDI r0, 108       ; l
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cmd_help_n
    LDI r7, 0x0403
    LDI r0, 112       ; p
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cmd_help_n
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cmd_help_n
    LDI r0, 1
    RET
cmd_help_n:
    LDI r0, 0
    RET

cmd_is_echo:
    LDI r7, 0x0400
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 99        ; c
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 104       ; h
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 111       ; o
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_ls:
    LDI r7, 0x0400
    LDI r0, 108       ; l
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 115       ; s
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_cat:
    LDI r7, 0x0400
    LDI r0, 99        ; c
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 97        ; a
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 116       ; t
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_ps:
    LDI r7, 0x0400
    LDI r0, 112       ; p
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 115       ; s
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_kill:
    LDI r7, 0x0400
    LDI r0, 107       ; k
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 105       ; i
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 108       ; l
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 108       ; l
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_export:
    LDI r7, 0x0400
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 120       ; x
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 112       ; p
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 111       ; o
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 114       ; r
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0405
    LDI r0, 116       ; t
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0406
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_clear:
    LDI r7, 0x0400
    LDI r0, 99        ; c
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 108       ; l
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 97        ; a
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 114       ; r
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0405
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_rm:
    LDI r7, 0x0400
    LDI r0, 114       ; r
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 109       ; m
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_cp:
    LDI r7, 0x0400
    LDI r0, 99        ; c
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 112       ; p
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_hypervisor:
    LDI r7, 0x0400
    LDI r0, 104       ; h
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 121       ; y
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 112       ; p
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 114       ; r
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0405
    LDI r0, 118       ; v
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0406
    LDI r0, 105       ; i
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0407
    LDI r0, 115       ; s
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0408
    LDI r0, 111       ; o
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0409
    LDI r0, 114       ; r
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x040A
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_edit:
    LDI r7, 0x0400
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 100       ; d
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 105       ; i
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 116       ; t
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_save:
    LDI r7, 0x0400
    LDI r0, 115       ; s
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 97        ; a
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 118       ; v
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_grep:
    LDI r7, 0x0400
    LDI r0, 103       ; g
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 114       ; r
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 112       ; p
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_head:
    LDI r7, 0x0400
    LDI r0, 104       ; h
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 97        ; a
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 100       ; d
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_tail:
    LDI r7, 0x0400
    LDI r0, 116       ; t
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 97        ; a
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 105       ; i
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 108       ; l
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_wc:
    LDI r7, 0x0400
    LDI r0, 119       ; w
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 99        ; c
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cmd_is_date:
    LDI r7, 0x0400
    LDI r0, 100       ; d
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0401
    LDI r0, 97        ; a
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0402
    LDI r0, 116       ; t
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0403
    LDI r0, 101       ; e
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r7, 0x0404
    LDI r0, 0
    LOAD r6, r7
    CMP r0, r6
    JNZ r0, cno
    LDI r0, 1
    RET

cno:
    LDI r0, 0
    RET

; ── Built-in command implementations ──────────────────────────

do_help:
    ; Display available commands
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r1, 2
    LDI r12, help_text
    TEXT r1, r6, r12
    JMP exec_done

do_echo:
    ; Print the argument
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x0600
    TEXT r1, r6, r12
    JMP exec_done

do_ls:
    ; List files using LS opcode
    LDI r6, 0x0800
    LS r6                  ; list files into buffer at 0x0800
    ; r0 = number of files
    ; Display each filename
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x0800
    TEXT r1, r6, r12
    JMP exec_done

do_cat:
    ; Read and display a file
    ; Argument (filename) at 0x0600
    LDI r6, 0x0600       ; filename addr
    LDI r1, 0            ; mode = read
    OPEN r6, r1           ; r0 = fd
    ; Check for error
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, exec_done      ; error, skip

    MOV r9, r0            ; save fd in r9
    LDI r12, 0x1000        ; read buffer
    LDI r13, 200           ; max bytes
    READ r9, r12, r13       ; r0 = bytes read
    ; Null terminate
    LDI r11, 200
    CMP r0, r11
    BLT r0, cat_term_ok
    LDI r0, 200
cat_term_ok:
    LDI r11, 0x1000
    ADD r0, r11
    LDI r4, 0
    STORE r0, r4
    ; Display
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x1000
    TEXT r1, r6, r12
    CLOSE r9
    JMP exec_done

do_ps:
    ; Display process info
    ; For now, show PID count and current PID
    GETPID
    MOV r9, r0            ; save our PID
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    ; Show "PID: N" using register value
    ; Write PID as text at 0x1500
    LDI r7, 0x1500
    LDI r0, 80            ; P
    STORE r7, r0
    LDI r7, 0x1501
    LDI r0, 73            ; I
    STORE r7, r0
    LDI r7, 0x1502
    LDI r0, 68            ; D
    STORE r7, r0
    LDI r7, 0x1503
    LDI r0, 58            ; :
    STORE r7, r0
    LDI r7, 0x1504
    LDI r0, 32            ; space
    STORE r7, r0
    ; Convert PID to decimal digits
    LDI r7, 0x1505
    LDI r6, 48            ; '0'
    ADD r0, r6
    STORE r7, r0
    LDI r7, 0x1506
    LDI r0, 0
    STORE r7, r0
    LDI r1, 4
    LDI r12, 0x1500
    TEXT r1, r6, r12
    JMP exec_done

do_kill:
    ; Kill a process by PID
    ; Argument should be a number -- simplified: just echo "kill"
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r12, kill_msg
    LDI r1, 4
    TEXT r1, r6, r12
    JMP exec_done

do_export:
    ; Set environment variable
    ; Argument format: KEY=VALUE
    ; For simplicity, just acknowledge
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r12, export_msg
    LDI r1, 4
    TEXT r1, r6, r12
    JMP exec_done

do_clear:
    LDI r0, 0
    FILL r0
    LDI r7, 0x1201
    LDI r0, 20
    STORE r7, r0
    JMP exec_done

do_rm:
    ; Delete a file: rm <filename>
    ; Argument (filename) at 0x0600
    LDI r7, 0x0600
    LOAD r0, r7
    JZ r0, rm_usage
    ; Copy arg to a clean buffer at 0x1600
    LDI r14, 0x0600
    LDI r5, 0x1600
rm_copy:
    LOAD r0, r14
    JZ r0, rm_copy_done
    STORE r5, r0
    LDI r0, 1
    ADD r14, r0
    ADD r5, r0
    JMP rm_copy
rm_copy_done:
    LDI r0, 0
    STORE r5, r0      ; null terminate
    ; UNLINK r6 where r6 = 0x1600
    LDI r6, 0x1600
    UNLINK r6
    ; r0 = 0 on success, 0xFFFFFFFF on error
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JNZ r0, rm_ok
    ; Print error
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r1, 8          ; "rm: error"
    LDI r12, 0x1700
    ; Store "rm: error" message
    LDI r7, 0x1700
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1701
    LDI r0, 109        ; m
    STORE r7, r0
    LDI r7, 0x1702
    LDI r0, 58         ; :
    STORE r7, r0
    LDI r7, 0x1703
    LDI r0, 32         ; space
    STORE r7, r0
    LDI r7, 0x1704
    LDI r0, 101        ; e
    STORE r7, r0
    LDI r7, 0x1705
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1706
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1707
    LDI r0, 111        ; o
    STORE r7, r0
    LDI r7, 0x1708
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1709
    LDI r0, 0
    STORE r7, r0
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r1, 9
    LDI r12, 0x1700
    TEXT r1, r6, r12
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    JMP exec_done
rm_ok:
    JMP exec_done
rm_usage:
    ; Print "rm <file>"
    LDI r7, 0x1700
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1701
    LDI r0, 109        ; m
    STORE r7, r0
    LDI r7, 0x1702
    LDI r0, 32         ; space
    STORE r7, r0
    LDI r7, 0x1703
    LDI r0, 60         ; <
    STORE r7, r0
    LDI r7, 0x1704
    LDI r0, 102        ; f
    STORE r7, r0
    LDI r7, 0x1705
    LDI r0, 105        ; i
    STORE r7, r0
    LDI r7, 0x1706
    LDI r0, 108        ; l
    STORE r7, r0
    LDI r7, 0x1707
    LDI r0, 101        ; e
    STORE r7, r0
    LDI r7, 0x1708
    LDI r0, 62         ; >
    STORE r7, r0
    LDI r7, 0x1709
    LDI r0, 0
    STORE r7, r0
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r1, 9
    LDI r12, 0x1700
    TEXT r1, r6, r12
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    JMP exec_done

do_cp:
    ; Copy a file: cp <src> <dst>
    ; Arguments at 0x0600, separated by space
    ; Parse second argument from 0x0600 into 0x1800
    LDI r7, 0x0600
    LOAD r0, r7
    JZ r0, cp_usage
    ; Find space separator
    LDI r14, 0x0600
cp_find_space:
    LOAD r0, r14
    JZ r0, cp_usage    ; no space found -- need 2 args
    LDI r6, 32         ; space
    CMP r0, r6
    JZ r0, cp_found_space
    LDI r0, 1
    ADD r14, r0
    JMP cp_find_space
cp_found_space:
    ; Skip the space, copy rest to 0x1800
    LDI r0, 1
    ADD r14, r0
    LDI r5, 0x1800
cp_copy_dst:
    LOAD r0, r14
    JZ r0, cp_copy_dst_done
    STORE r5, r0
    LDI r0, 1
    ADD r14, r0
    ADD r5, r0
    JMP cp_copy_dst
cp_copy_dst_done:
    LDI r0, 0
    STORE r5, r0
    ; Null-terminate the source filename (replace space with 0)
    LDI r14, 0x0600
    LDI r5, 0x1600
cp_copy_src:
    LOAD r0, r14
    JZ r0, cp_src_done
    LDI r6, 32
    CMP r0, r6
    JZ r0, cp_src_terminate
    STORE r5, r0
    LDI r0, 1
    ADD r14, r0
    ADD r5, r0
    JMP cp_copy_src
cp_src_terminate:
    LDI r0, 0
    STORE r5, r0
    JMP cp_do_copy
cp_src_done:
    STORE r5, r0
cp_do_copy:
    ; FCOPY r6, r1 where r6=0x1600 (src), r1=0x1800 (dst)
    LDI r6, 0x1600
    LDI r1, 0x1800
    FCOPY r6, r1
    ; Check result
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JNZ r0, cp_ok
    ; Print error
    LDI r7, 0x1700
    LDI r0, 99         ; c
    STORE r7, r0
    LDI r7, 0x1701
    LDI r0, 112        ; p
    STORE r7, r0
    LDI r7, 0x1702
    LDI r0, 58         ; :
    STORE r7, r0
    LDI r7, 0x1703
    LDI r0, 32         ; space
    STORE r7, r0
    LDI r7, 0x1704
    LDI r0, 101        ; e
    STORE r7, r0
    LDI r7, 0x1705
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1706
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1707
    LDI r0, 111        ; o
    STORE r7, r0
    LDI r7, 0x1708
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1709
    LDI r0, 0
    STORE r7, r0
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r1, 9
    LDI r12, 0x1700
    TEXT r1, r6, r12
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    JMP exec_done
cp_ok:
    JMP exec_done
cp_usage:
    LDI r7, 0x1700
    LDI r0, 99         ; c
    STORE r7, r0
    LDI r7, 0x1701
    LDI r0, 112        ; p
    STORE r7, r0
    LDI r7, 0x1702
    LDI r0, 32         ; space
    STORE r7, r0
    LDI r7, 0x1703
    LDI r0, 60         ; <
    STORE r7, r0
    LDI r7, 0x1704
    LDI r0, 115        ; s
    STORE r7, r0
    LDI r7, 0x1705
    LDI r0, 114        ; r
    STORE r7, r0
    LDI r7, 0x1706
    LDI r0, 99        ; c
    STORE r7, r0
    LDI r7, 0x1707
    LDI r0, 62         ; >
    STORE r7, r0
    LDI r7, 0x1708
    LDI r0, 32         ; space
    STORE r7, r0
    LDI r7, 0x1709
    LDI r0, 60         ; <
    STORE r7, r0
    LDI r7, 0x170A
    LDI r0, 100        ; d
    STORE r7, r0
    LDI r7, 0x170B
    LDI r0, 115        ; s
    STORE r7, r0
    LDI r7, 0x170C
    LDI r0, 116        ; t
    STORE r7, r0
    LDI r7, 0x170D
    LDI r0, 62         ; >
    STORE r7, r0
    LDI r7, 0x170E
    LDI r0, 0
    STORE r7, r0
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r1, 14
    LDI r12, 0x1700
    TEXT r1, r6, r12
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    JMP exec_done

do_hypervisor:
    PUSH r5
    PUSH r14
    ; Check if argument exists
    LDI r7, 0x0600
    LOAD r0, r7
    JZ r0, hypervisor_usage

    ; Copy argument (0x0600) to config buffer (0x1B00)
    LDI r14, 0x0600       ; src
    LDI r5, 0x1B00       ; dst
hypervisor_copy:
    LOAD r0, r14
    JZ r0, hypervisor_copy_done
    STORE r5, r0
    LDI r0, 1
    ADD r14, r0
    ADD r5, r0
    JMP hypervisor_copy
hypervisor_copy_done:
    LDI r0, 0
    STORE r5, r0         ; null terminate

    ; Call HYPERVISOR with config buffer address
    LDI r0, 0x1B00
    HYPERVISOR r0

    ; Check result: 0 = success, 0xFFFFFFFF = error, 0xFFFFFFFD = missing arch
    JZ r0, hypervisor_ok
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, hypervisor_err
    ; Missing arch or other error
    JMP hypervisor_err

hypervisor_ok:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    ; Display "hypervisor started" message
    LDI r1, 4
    LDI r12, hypervisor_ok_msg
    TEXT r1, r6, r12
    JMP hypervisor_done

hypervisor_usage:
    ; No argument -- show usage
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, hypervisor_usage_msg
    TEXT r1, r6, r12
    JMP hypervisor_done

hypervisor_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, hypervisor_err_msg
    TEXT r1, r6, r12
    JMP hypervisor_done

hypervisor_done:
    POP r14
    POP r5
    JMP exec_done

do_edit:
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3

    ; Check for argument
    LDI r7, 0x0600
    LOAD r0, r7
    JZ r0, edit_usage

    ; Open file for reading
    LDI r6, 0x0600       ; filename addr
    LDI r1, 0            ; mode = read
    OPEN r6, r1           ; r0 = fd
    ; Check for error
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, edit_err      ; file not found

    MOV r9, r0            ; save fd in r9

    ; Read file content into buffer at 0x2000
    LDI r12, 0x2000        ; read buffer (8KB, up to row 127 * 32 cols)
    LDI r13, 4096          ; max words to read
    READ r9, r12, r13       ; r0 = bytes read

    ; Close the file
    CLOSE r9

    ; Null terminate at position bytes_read
    LDI r11, 0x2000
    ADD r11, r0            ; r11 = buffer + bytes_read
    LDI r4, 0
    STORE r11, r4          ; null terminator

    ; Display file content on screen, line by line
    ; Each line is up to 32 chars, separated by newline (10) or null
    LDI r2, 0x2000       ; source pointer
    LDI r15, 4            ; y position (start near top)
    LDI r3, 0            ; line buffer index

edit_line_loop:
    LOAD r0, r2
    JZ r0, edit_done      ; null = end of file

    ; Check for newline (10)
    LDI r6, 10
    CMP r0, r6
    JZ r0, edit_newline

    ; Store char in line buffer at 0x2100 + index
    LDI r14, 0x2100
    ADD r14, r3
    STORE r14, r0

    LDI r6, 1
    ADD r2, r6           ; advance source
    ADD r3, r6           ; advance line index

    ; Check if line is 32 chars (screen width at 8px font)
    LDI r6, 32
    CMP r3, r6
    JZ r0, edit_line_full
    JMP edit_line_loop

edit_newline:
    ; Null-terminate current line
    LDI r14, 0x2100
    ADD r14, r3
    LDI r0, 0
    STORE r14, r0

    ; Display line at y position
    LDI r1, 4             ; x = 4
    LDI r12, 0x2100        ; line buffer
    TEXT r1, r15, r12      ; render text at (4, y)

    ; Advance to next line
    LDI r6, 1
    ADD r2, r6           ; skip the newline char
    ADD r15, r6           ; next y position
    LDI r3, 0            ; reset line buffer index
    JMP edit_line_loop

edit_line_full:
    ; Null-terminate
    LDI r14, 0x2100
    ADD r14, r3
    LDI r0, 0
    STORE r14, r0

    ; Display line
    LDI r1, 4
    LDI r12, 0x2100
    TEXT r1, r15, r12

    ; Next line (no source advance since char was already stored)
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    LDI r3, 0
    JMP edit_line_loop

edit_done:
    ; Null-terminate last line if there's content
    JZ r3, edit_show_msg
    LDI r14, 0x2100
    ADD r14, r3
    LDI r0, 0
    STORE r14, r0
    LDI r1, 4
    LDI r12, 0x2100
    TEXT r1, r15, r12

edit_show_msg:
    ; Show "[edit: filename]" at bottom
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, edit_ok_msg
    TEXT r1, r6, r12
    JMP edit_cleanup

edit_usage:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, edit_usage_msg
    TEXT r1, r6, r12
    JMP edit_cleanup

edit_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, edit_err_msg
    TEXT r1, r6, r12

edit_cleanup:
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

do_save:
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3

    ; Check for argument
    LDI r7, 0x0600
    LOAD r0, r7
    JZ r0, save_usage

    ; Open file for writing (mode 1 = write/create)
    LDI r6, 0x0600       ; filename addr
    LDI r1, 1            ; mode = write
    OPEN r6, r1           ; r0 = fd
    ; Check for error
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, save_err      ; could not create file

    MOV r9, r0            ; save fd in r9

    ; Calculate content length from edit buffer at 0x2000
    ; Scan for null terminator
    LDI r2, 0x2000
    LDI r15, 0            ; length counter
save_scan:
    LOAD r0, r2
    JZ r0, save_scan_done
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    JMP save_scan

save_scan_done:
    ; If nothing to save, show message
    JZ r15, save_empty

    ; Write content to file
    LDI r6, 0x2000        ; buffer addr
    MOV r1, r6             ; fd_reg = r9 already
    ; WRITE fd_reg, buf_reg, len_reg
    MOV r6, r9             ; r6 = fd
    LDI r1, 0x2000         ; buf addr
    MOV r12, r15            ; length
    WRITE r6, r1, r12       ; r0 = bytes written

    CLOSE r9               ; close file

    ; Show "[saved: N bytes]" message
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, save_ok_msg
    TEXT r1, r6, r12
    JMP save_cleanup

save_empty:
    CLOSE r9
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, save_empty_msg
    TEXT r1, r6, r12
    JMP save_cleanup

save_usage:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, save_usage_msg
    TEXT r1, r6, r12
    JMP save_cleanup

save_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, save_err_msg
    TEXT r1, r6, r12

save_cleanup:
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

do_grep:
    ; grep <pattern> <file> -- search file for lines containing pattern
    ; Argument at 0x0600 is "pattern file"
    ; We need to split: first word = pattern, second word = filename
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3
    PUSH r15
    PUSH r2

    ; Parse argument: find first space to split pattern from filename
    ; Store pattern at 0x2200, filename at 0x2300
    LDI r2, 0x0600      ; arg pointer
    LDI r15, 0x2200      ; pattern buffer
    LDI r3, 0           ; pattern length

grep_parse_pat:
    LOAD r0, r2
    JZ r0, grep_no_file   ; no space found, error
    LDI r6, 32            ; space
    CMP r0, r6
    JZ r0, grep_copy_file
    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    ADD r3, r6
    JMP grep_parse_pat

grep_copy_file:
    ; Skip the space
    LDI r6, 1
    ADD r2, r6
    ; Copy filename to 0x2300
    LDI r15, 0x2300

grep_copy_file_loop:
    LOAD r0, r2
    JZ r0, grep_have_file
    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    JMP grep_copy_file_loop

grep_have_file:
    LDI r0, 0
    STORE r15, r0         ; null terminate filename
    ; Null terminate pattern
    LDI r15, 0x2200
    ADD r15, r3
    STORE r15, r0

    ; Check pattern length > 0
    JZ r3, grep_err

    ; Open file
    LDI r6, 0x2300       ; filename addr
    LDI r1, 0            ; mode = read
    OPEN r6, r1           ; r0 = fd
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, grep_err

    MOV r9, r0            ; save fd

    ; Read file content into 0x2000
    LDI r12, 0x2000
    LDI r13, 400           ; max bytes to read
    READ r9, r12, r13
    CLOSE r9

    ; Null terminate at read position
    LDI r11, 0x2000
    ADD r11, r0
    LDI r4, 0
    STORE r11, r4

    ; Scan file line by line, check if each line contains the pattern
    ; Line buffer at 0x2400, max 64 chars
    ; Save file pointer at 0x2380 (pattern_len * 4 + pattern_buf end)
    ; Actually, save at 0x23FF (safe scratch)
    LDI r2, 0x2000       ; file pointer
    LDI r14, 0            ; match count

grep_line_loop:
    ; Save file pointer to scratch
    MOV r8, r2           ; r8 = saved file ptr

    LOAD r0, r2
    JZ r0, grep_done       ; end of file

    ; Copy line to buffer at 0x2400, track length
    LDI r15, 0x2400
    LDI r3, 0            ; line length

grep_copy_line:
    LOAD r0, r2
    JZ r0, grep_check_line     ; end of file, check this line
    LDI r6, 10                 ; newline
    CMP r0, r6
    JZ r0, grep_advance_nl
    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    ADD r3, r6
    LDI r6, 64
    CMP r3, r6
    JZ r0, grep_check_line
    JMP grep_copy_line

grep_advance_nl:
    LDI r6, 1
    ADD r2, r6             ; skip newline

grep_check_line:
    ; Null terminate line buffer
    LDI r0, 0
    STORE r15, r0

    ; Compute pattern length (scan 0x2200 for null)
    LDI r5, 0
    LDI r10, 0x2200

grep_scan_pat_len:
    LOAD r0, r10
    JZ r0, grep_have_pat_len
    LDI r6, 1
    ADD r10, r6
    ADD r5, r6
    JMP grep_scan_pat_len

grep_have_pat_len:
    ; r5 = pattern length, r3 = line length
    ; Skip if line shorter than pattern
    CMP r3, r5
    BLT r0, grep_next_line

    ; Simple substring search: check each starting position
    ; r3 - r5 = max starting position
    SUB r3, r5           ; r3 = max_start (line_len - pat_len)

grep_search_pos:
    ; r15 = current position in line (0x2400 + offset)
    ; Use offset tracking instead of absolute address comparison
    LDI r7, 0              ; search offset

grep_search_pos2:
    CMP r7, r3            ; offset vs max_start
    BGE r0, grep_next_line

    ; Compare pattern with line at offset r7
    LDI r10, 0x2400
    ADD r10, r7            ; r10 = line_base + offset
    LDI r14, 0x2200        ; pattern start
    LDI r6, 0              ; chars matched

grep_cmp_loop:
    LOAD r0, r10
    LOAD r1, r14
    CMP r0, r1
    JNZ r0, grep_no_match_here
    ; Match so far
    LDI r12, 1
    ADD r10, r12
    ADD r14, r12
    ADD r6, r12             ; count matched chars
    CMP r6, r5            ; matched vs pattern_len
    BLT r0, grep_cmp_loop
    JMP grep_found_match

grep_no_match_here:
    LDI r12, 1
    ADD r7, r12             ; advance offset
    JMP grep_search_pos2

grep_found_match:
    ; Display the matching line
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x2400
    TEXT r1, r6, r12

grep_next_line:
    ; Restore file pointer from r8
    MOV r2, r8
    JMP grep_line_loop

grep_no_file:
    ; Missing filename argument
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, grep_usage
    TEXT r1, r6, r12
    JMP grep_cleanup

grep_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, grep_err_msg
    TEXT r1, r6, r12
    JMP grep_cleanup

grep_done:
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

grep_cleanup:
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

do_head:
    ; head <file> [N] -- display first N lines (default 10)
    ; Argument at 0x0600 is "file N"
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3
    PUSH r15
    PUSH r2

    ; Parse: filename at 0x0600, optional number after space
    ; Copy filename to 0x2200, check for trailing number
    LDI r2, 0x0600
    LDI r15, 0x2200

head_copy_name:
    LOAD r0, r2
    JZ r0, head_name_done
    LDI r6, 32
    CMP r0, r6
    JZ r0, head_parse_n
    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    JMP head_copy_name

head_parse_n:
    ; Skip space
    LDI r6, 1
    ADD r2, r6
    ; Parse number (single digit 1-9 for simplicity)
    LDI r5, 10           ; default N = 10
    LOAD r0, r2
    JZ r0, head_name_done  ; no number, use default
    ; Subtract '0' (48) to get digit
    LDI r6, 48
    SUB r0, r6
    ; If result is 1-9, use it; else default 10
    LDI r6, 1
    CMP r0, r6
    BLT r0, head_name_done
    LDI r6, 9
    CMP r0, r6
    BGE r0, head_name_done
    MOV r5, r0           ; use parsed N

head_name_done:
    LDI r0, 0
    STORE r15, r0         ; null terminate filename

    ; Check for empty filename
    LDI r15, 0x2200
    LOAD r0, r15
    JZ r0, head_err

    ; Open file
    LDI r6, 0x2200
    LDI r1, 0
    OPEN r6, r1
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, head_err

    MOV r9, r0
    LDI r12, 0x2000
    LDI r13, 400
    READ r9, r12, r13
    CLOSE r9

    ; Null terminate
    LDI r11, 0x2000
    ADD r11, r0
    LDI r4, 0
    STORE r11, r4

    ; Display first N lines
    LDI r2, 0x2000       ; file pointer
    LDI r15, 0x2400       ; line buffer
    LDI r14, 0            ; line count
    LDI r3, 0            ; chars in line

head_read_line:
    LOAD r0, r2
    JZ r0, head_done      ; end of file

    LDI r6, 10
    CMP r0, r6
    JZ r0, head_print_line

    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    ADD r3, r6
    LDI r6, 32
    CMP r3, r6
    BLT r0, head_read_line
    ; Line too long, print what we have
    JMP head_print_line

head_print_line:
    ; Null terminate
    LDI r0, 0
    STORE r15, r0
    ; Display
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x2400
    TEXT r1, r6, r12

    ; Increment line count, check limit
    LDI r6, 1
    ADD r14, r6
    CMP r14, r5
    BGE r0, head_done

    ; Skip newline if present
    LOAD r0, r2
    LDI r6, 10
    CMP r0, r6
    JZ r0, head_skip_nl
    JMP head_reset_line

head_skip_nl:
    LDI r6, 1
    ADD r2, r6

head_reset_line:
    LDI r15, 0x2400
    LDI r3, 0
    JMP head_read_line

head_done:
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

head_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, head_usage_msg
    TEXT r1, r6, r12
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

do_tail:
    ; tail <file> [N] -- display last N lines (default 10)
    ; Strategy: read whole file, count newlines, display last N
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3
    PUSH r15
    PUSH r2

    ; Parse: filename at 0x0600, optional number
    LDI r2, 0x0600
    LDI r15, 0x2200

tail_copy_name:
    LOAD r0, r2
    JZ r0, tail_name_done
    LDI r6, 32
    CMP r0, r6
    JZ r0, tail_parse_n
    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    JMP tail_copy_name

tail_parse_n:
    LDI r6, 1
    ADD r2, r6
    LDI r5, 10           ; default N = 10
    LOAD r0, r2
    JZ r0, tail_name_done
    LDI r6, 48
    SUB r0, r6
    LDI r6, 1
    CMP r0, r6
    BLT r0, tail_name_done
    LDI r6, 9
    CMP r0, r6
    BGE r0, tail_name_done
    MOV r5, r0

tail_name_done:
    LDI r0, 0
    STORE r15, r0

    LDI r15, 0x2200
    LOAD r0, r15
    JZ r0, tail_err

    ; Open and read file
    LDI r6, 0x2200
    LDI r1, 0
    OPEN r6, r1
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, tail_err

    MOV r9, r0
    LDI r12, 0x2000
    LDI r13, 400
    READ r9, r12, r13
    CLOSE r9

    LDI r11, 0x2000
    ADD r11, r0
    LDI r4, 0
    STORE r11, r4

    ; Count total lines
    LDI r2, 0x2000
    LDI r14, 1            ; line count (at least 1)

tail_count_lines:
    LOAD r0, r2
    JZ r0, tail_count_done
    LDI r6, 10
    CMP r0, r6
    JNZ r0, tail_count_next
    LDI r6, 1
    ADD r14, r6           ; increment line count
tail_count_next:
    LDI r6, 1
    ADD r2, r6
    JMP tail_count_lines

tail_count_done:
    ; Compute start line: total_lines - N (but min 1)
    MOV r15, r14           ; total_lines
    SUB r15, r5           ; total - N
    LDI r6, 1
    CMP r15, r6
    BGE r0, tail_skip_ok
    MOV r15, r6            ; at least line 1

tail_skip_ok:
    ; Skip to start line
    LDI r2, 0x2000
    LDI r14, 1             ; current line

tail_skip_loop:
    CMP r14, r15
    BGE r0, tail_display   ; reached start line

tail_skip_next:
    LOAD r0, r2
    JZ r0, tail_done       ; end of file
    LDI r6, 10
    CMP r0, r6
    JNZ r0, tail_skip_adv
    LDI r6, 1
    ADD r14, r6            ; next line on newline
tail_skip_adv:
    LDI r6, 1
    ADD r2, r6
    JMP tail_skip_loop

tail_display:
    ; Display remaining lines
    LDI r15, 0x2400       ; line buffer
    LDI r3, 0            ; chars in line

tail_read_char:
    LOAD r0, r2
    JZ r0, tail_flush
    LDI r6, 10
    CMP r0, r6
    JZ r0, tail_flush

    STORE r15, r0
    LDI r6, 1
    ADD r2, r6
    ADD r15, r6
    ADD r3, r6
    LDI r6, 32
    CMP r3, r6
    BLT r0, tail_read_char
    JMP tail_flush

tail_flush:
    LDI r0, 0
    STORE r15, r0
    ; Display line
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x2400
    TEXT r1, r6, r12

    ; Check if we consumed a newline
    LOAD r0, r2
    LDI r6, 10
    CMP r0, r6
    JZ r0, tail_skip_newline

tail_reset:
    LDI r15, 0x2400
    LDI r3, 0
    LOAD r0, r2
    JZ r0, tail_done
    JMP tail_read_char

tail_skip_newline:
    LDI r6, 1
    ADD r2, r6
    JMP tail_reset

tail_done:
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

tail_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, tail_usage_msg
    TEXT r1, r6, r12
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

do_wc:
    ; wc <file> -- count lines, words, and bytes
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3
    PUSH r15
    PUSH r2

    ; Check for argument
    LDI r7, 0x0600
    LOAD r0, r7
    JZ r0, wc_err

    ; Open file
    LDI r6, 0x0600
    LDI r1, 0
    OPEN r6, r1
    LDI r6, 0xFFFFFFFF
    CMP r0, r6
    JZ r0, wc_err

    MOV r9, r0
    LDI r12, 0x2000
    LDI r13, 400
    READ r9, r12, r13
    MOV r3, r0           ; save byte count
    CLOSE r9

    ; Null terminate
    LDI r11, 0x2000
    ADD r11, r0
    LDI r4, 0
    STORE r11, r4

    ; Count lines and words
    LDI r2, 0x2000       ; file pointer
    LDI r14, 0            ; line count
    LDI r5, 0            ; word count
    LDI r10, 0            ; prev was space (1=yes, 0=no)

wc_scan:
    LOAD r0, r2
    JZ r0, wc_format      ; end of file

    ; Count newlines
    LDI r6, 10
    CMP r0, r6
    JNZ r0, wc_not_nl
    LDI r6, 1
    ADD r14, r6           ; line++
    LDI r10, 1            ; prev = space
    JMP wc_next

wc_not_nl:
    ; Count words: space or other whitespace transitions
    LDI r6, 32            ; space
    CMP r0, r6
    JNZ r0, wc_not_space
    LDI r10, 1            ; prev = space
    JMP wc_next

wc_not_space:
    ; If prev was space and current is not, it is a new word
    LDI r6, 1
    CMP r10, r6
    JNZ r0, wc_next
    ADD r5, r6           ; word++
    LDI r10, 0            ; prev = not space

wc_next:
    LDI r6, 1
    ADD r2, r6
    JMP wc_scan

wc_format:
    ; Build output string at 0x2400: "N N N"
    ; Format: lines words bytes
    LDI r15, 0x2400

    ; Convert lines (r14) to decimal
    CALL wc_utoa
    ; Add space
    LDI r0, 32
    STORE r15, r0
    LDI r6, 1
    ADD r15, r6

    ; Convert words (r5) to decimal
    MOV r2, r5
    CALL wc_utoa
    ; Add space
    LDI r0, 32
    STORE r15, r0
    LDI r6, 1
    ADD r15, r6

    ; Convert bytes (r3) to decimal
    MOV r2, r3
    CALL wc_utoa
    ; Null terminate
    LDI r0, 0
    STORE r15, r0

    ; Display
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x2400
    TEXT r1, r6, r12
    JMP wc_cleanup

wc_utoa:
    ; Convert r2 to decimal, write to buffer at r15
    ; Modifies r2, does not change r15 (caller manages it)
    PUSH r10
    ; Handle 0 case
    JNZ r2, wc_utoa_nonzero
    LDI r0, 48            ; '0'
    STORE r15, r0
    LDI r6, 1
    ADD r15, r6
    POP r10
    RET

wc_utoa_nonzero:
    ; Find number of digits by repeated division
    LDI r10, 0            ; digit count
    LDI r14, 10
    MOV r5, r2          ; temp copy

wc_count_digits:
    JZ r5, wc_do_digits
    LDI r6, 10
    DIV r5, r6
    LDI r6, 1
    ADD r10, r6
    JMP wc_count_digits

wc_do_digits:
    ; r10 = digit count. We need to write digits from most significant.
    ; Write digits to a temp area at 0x2500, then copy in order.
    LDI r14, 0x2500       ; temp digit buffer
    LDI r5, 0            ; digit index
    MOV r2, r5          ; restore original? No, r2 was modified.
    ; Actually we need to re-do the conversion. Let me use a simpler approach:
    ; Write digits in reverse order, then reverse them.
    ; Even simpler: since max bytes ~400, max 3 digits. Handle up to 999.
    POP r10
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3

    ; Save r15 (output pointer)
    MOV r3, r15

    ; Write digits in reverse at 0x2500
    LDI r14, 0x2500
    LDI r5, 0            ; digit count

wc_div_loop:
    JZ r2, wc_rev_digits
    LDI r6, 10
    DIV r2, r6
    LDI r6, 48            ; '0'
    ADD r0, r6            ; r0 = digit char
    STORE r14, r0
    LDI r6, 1
    ADD r14, r6
    ADD r5, r6
    JMP wc_div_loop

wc_rev_digits:
    ; r5 = digit count at 0x2500 (reversed)
    ; Copy in reverse order to output
    JZ r5, wc_utoa_done
    LDI r6, 1
    SUB r5, r6
    LDI r14, 0x2500
    ADD r14, r5
    LOAD r0, r14
    STORE r3, r0
    LDI r6, 1
    ADD r3, r6
    JMP wc_rev_digits

wc_utoa_done:
    MOV r15, r3          ; update output pointer
    POP r3
    POP r14
    POP r5
    POP r10
    POP r10
    RET

wc_err:
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, wc_usage_msg
    TEXT r1, r6, r12
wc_cleanup:
    POP r2
    POP r15
    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

do_date:
    ; Display ticks since boot (proxy for uptime)
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3

    ; Read TICKS from RAM[0xFFE]
    LDI r7, 0xFFE
    LOAD r2, r7           ; r2 = ticks

    ; Build output: "ticks: NNNN" at 0x2400
    LDI r15, 0x2400
    ; Write "ticks: "
    LDI r0, 116           ; t
    STORE r15, r0
    LDI r6, 1
    ADD r15, r6
    LDI r0, 105           ; i
    STORE r15, r0
    ADD r15, r6
    LDI r0, 99            ; c
    STORE r15, r0
    ADD r15, r6
    LDI r0, 107           ; k
    STORE r15, r0
    ADD r15, r6
    LDI r0, 115           ; s
    STORE r15, r0
    ADD r15, r6
    LDI r0, 58            ; :
    STORE r15, r0
    ADD r15, r6
    LDI r0, 32            ; space
    STORE r15, r0
    ADD r15, r6

    ; Convert ticks to decimal
    CALL date_utoa

    ; Null terminate
    LDI r0, 0
    STORE r15, r0

    ; Display
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r1, 4
    LDI r12, 0x2400
    TEXT r1, r6, r12

    POP r3
    POP r14
    POP r5
    POP r10
    JMP exec_done

date_utoa:
    ; Convert r2 to decimal, write to buffer at r15
    PUSH r10
    PUSH r5
    PUSH r14
    PUSH r3

    MOV r3, r15

    ; Handle 0
    JNZ r2, date_nonzero
    LDI r0, 48
    STORE r15, r0
    LDI r6, 1
    ADD r15, r6
    POP r3
    POP r14
    POP r5
    POP r10
    RET

date_nonzero:
    ; Write digits in reverse at 0x2600
    LDI r14, 0x2600
    LDI r5, 0

date_div:
    JZ r2, date_rev
    LDI r6, 10
    DIV r2, r6
    LDI r6, 48
    ADD r0, r6
    STORE r14, r0
    LDI r6, 1
    ADD r14, r6
    ADD r5, r6
    JMP date_div

date_rev:
    JZ r5, date_done
    LDI r6, 1
    SUB r5, r6
    LDI r14, 0x2600
    ADD r14, r5
    LOAD r0, r14
    STORE r3, r0
    LDI r6, 1
    ADD r3, r6
    JMP date_rev

date_done:
    MOV r15, r3
    POP r3
    POP r14
    POP r5
    POP r10
    RET

do_exec:
    ; Execute external program via EXEC
    ; Command name at 0x0400
    LDI r6, 0x0400
    EXEC r6               ; r0 = PID or error
    ; Check for error
    LDI r1, 0xFFFFFFFF
    CMP r0, r1
    JZ r0, exec_error

    ; Save PID
    LDI r7, 0x1202
    STORE r7, r0

    ; Wait for child to complete
exec_wait:
    LDI r6, 0x1202
    LOAD r6, r7
    WAITPID r6
    JZ r0, exec_wait     ; still running

    ; Check for pipe mode
    LDI r7, 0x1207
    LOAD r0, r7
    LDI r6, 1
    CMP r0, r6
    JZ r0, exec_pipe

    JMP exec_done

exec_pipe:
    ; Execute second command from pipe buffer
    LDI r6, 0x1400
    EXEC r6
    LDI r7, 0x1202
    STORE r7, r0
exec_pipe_wait:
    LDI r6, 0x1202
    LOAD r6, r7
    WAITPID r6
    JZ r0, exec_pipe_wait
    JMP exec_done

exec_error:
    ; Display "command not found"
    LDI r7, 0x1201
    LOAD r6, r7
    LDI r0, 12
    ADD r6, r0
    STORE r7, r6
    LDI r12, not_found_msg
    LDI r1, 4
    TEXT r1, r6, r12
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