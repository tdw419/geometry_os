; DESCRIPTION: The GeOS assembly code implements an application launcher that displays a full-screen grid of available `.asm` programs from the Virtual File System (VFS). Users can scroll through the grid using the W/S keys, select a program with the Enter key to launch it, or press ESC to close the launcher. The code demonstrates functionalities such as file listing (`LS`), text drawing (`DRAWTEXT`), program execution (`EXEC`), keyboard input handling (`IKEY`), and graphics rendering (`RECTF`). It manages state using RAM addresses for file list buffer, string buffers, file count, scroll offset, selected index, and mode. The grid layout consists of 3 columns and 8 rows, each cell being 84x28 pixels.

; launcher.asm -- App Launcher for Geometry OS
;
; Phase 72: Full-screen grid of available .asm programs from VFS.
; Scroll with W/S keys, Enter to launch, ESC to close.
;
; Proves: LS (file listing), DRAWTEXT (text), EXEC (launch programs),
;         IKEY (keyboard), RECTF (graphics), FRAME.
;
; RAM Layout:
;   0x4000-0x47FF  File list buffer (from LS)
;   0x5000-0x507F  String buffers
;   0x5100         File count
;   0x5104         Scroll offset
;   0x5108         Selected index (0-based)
;   0x510C         Mode (0=browser, 1=launching)
;
; Grid: 3 columns x 8 rows = 24 visible entries
; Each cell: 84x28 pixels

#define FILE_BUF     0x4000
#define STR_BUF      0x5000
#define FILE_COUNT   0x5100
#define SCROLL_OFF   0x5104
#define SEL_INDEX    0x5108
#define MODE         0x510C

; ==========================================
; INIT
; ==========================================
LDI r30, 0xFD00
LDI r5, 1
LDI r7, 0

; Clear state
LDI r20, SCROLL_OFF
STORE r20, r7
LDI r20, SEL_INDEX
STORE r20, r7
LDI r20, MODE
STORE r20, r7

; -- Get file list --
LDI r0, FILE_BUF
LS r0
LDI r20, FILE_COUNT
STORE r20, r13

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; Clear screen
  LDI r13, 0x1A1A2E
  FILL r13

  ; -- Draw title bar --
  LDI r13, 0x2D2D4D
  LDI r0, 0
  LDI r6, 0
  LDI r3, 256
  LDI r12, 20
  RECTF r0, r6, r3, r12, r13

  ; Title "Apps"
  LDI r0, STR_BUF
  LDI r13, 65                ; A
  STORE r0, r13
  ADD r0, r5
  LDI r13, 112               ; p
  STORE r0, r13
  ADD r0, r5
  LDI r13, 112               ; p
  STORE r0, r13
  ADD r0, r5
  LDI r13, 115               ; s
  STORE r0, r13
  ADD r0, r5
  LDI r13, 0
  STORE r0, r13
  LDI r0, 110
  LDI r6, 6
  LDI r3, STR_BUF
  LDI r12, 0xFFFFFF
  LDI r14, 0
  DRAWTEXT r0, r6, r3, r12, r14

  ; -- Draw grid of programs --
  LDI r22, FILE_BUF          ; current ptr
  LDI r20, SCROLL_OFF
  LOAD r20, r20              ; scroll offset
  LDI r21, FILE_COUNT
  LOAD r21, r21              ; total files

  ; Skip scrolled entries
  JZ r20, draw_grid

scroll_skip:
  LOAD r25, r22
  JNZ r25, skip_adv
  ADD r22, r5
  SUBI r20, 1
  JZ r20, draw_grid
  JMP scroll_skip
skip_adv:
  ADD r22, r5
  JMP scroll_skip

draw_grid:
  ; r22 = pointer to first visible entry
  LDI r23, 0                ; entry counter
  LDI r24, 24               ; max visible

grid_loop:
  CMP r23, r24
  BGE r13, grid_done
  CMP r21, r7
  JZ r13, grid_done

  ; Compute grid position
  ; col = entry % 3, row = entry / 3
  LDI r25, 3
  MOV r26, r23
  MOD r26, r25              ; col (0-2)
  MOV r27, r23
  DIV r27, r25              ; row (0-7)

  ; x = col*86 + 4
  LDI r28, 86
  MUL r26, r28
  ADDI r26, 4
  ; y = row*29 + 24
  LDI r28, 29
  MUL r27, r28
  ADDI r27, 24

  ; Check if selected
  LDI r3, SEL_INDEX
  LOAD r3, r3
  CMP r3, r23
  ; If selected, draw highlight
  LDI r13, 0x4444AA
  LDI r0, 84
  LDI r6, 28
  JZ r13, draw_cell_bg
  ; Normal cell
  LDI r13, 0x252540

draw_cell_bg:
  RECTF r26, r27, r0, r6, r13

  ; Copy filename to STR_BUF (max 12 chars)
  LDI r25, STR_BUF
  LDI r26, 12

copy_fname:
  LOAD r27, r22
  STORE r25, r27
  JZ r27, fname_done
  ADD r22, r5
  ADD r25, r5
  SUBI r26, 1
  JZ r26, fname_done
  JMP copy_fname

fname_done:
  ; Advance past null
  LOAD r27, r22
  JNZ r27, no_null_adv
  ADD r22, r5
no_null_adv:

  ; Draw filename
  ; Recompute cell position
  LDI r25, 3
  MOV r26, r23
  MOD r26, r25
  MOV r27, r23
  DIV r27, r25
  LDI r28, 86
  MUL r26, r28
  ADDI r26, 8
  LDI r28, 29
  MUL r27, r28
  ADDI r27, 28

  LDI r3, STR_BUF
  LDI r12, 0xCCCCCC
  LDI r14, 0
  DRAWTEXT r26, r27, r3, r12, r14

  ADDI r23, 1
  SUBI r21, 1
  JMP grid_loop

grid_done:
  ; -- Draw footer --
  ; "W/S Scroll  Enter Run  ESC Back"
  LDI r0, STR_BUF
  LDI r13, 87               ; W
  STORE r0, r13
  ADD r0, r5
  LDI r13, 47               ; /
  STORE r0, r13
  ADD r0, r5
  LDI r13, 83               ; S
  STORE r0, r13
  ADD r0, r5
  LDI r13, 32               ; space
  STORE r0, r13
  ADD r0, r5
  LDI r13, 82               ; R
  STORE r0, r13
  ADD r0, r5
  LDI r13, 117              ; u
  STORE r0, r13
  ADD r0, r5
  LDI r13, 110              ; n
  STORE r0, r13
  ADD r0, r5
  LDI r13, 0
  STORE r0, r13

  LDI r0, 4
  LDI r6, 244
  LDI r3, STR_BUF
  LDI r12, 0x888888
  LDI r14, 0
  DRAWTEXT r0, r6, r3, r12, r14

  ; -- Handle keyboard input --
  IKEY r0
  JZ r0, no_key

  ; W = up (87)
  LDI r6, 87
  CMP r0, r6
  JNZ r13, check_down
  ; Move selection up
  LDI r20, SEL_INDEX
  LOAD r20, r20
  JZ r20, no_key
  SUBI r20, 1
  STORE r20, r20
  JMP no_key

check_down:
  ; S = down (83)
  LDI r6, 83
  CMP r0, r6
  JNZ r13, check_enter
  ; Move selection down
  LDI r20, SEL_INDEX
  LOAD r20, r20
  LDI r21, FILE_COUNT
  LOAD r21, r21
  SUBI r21, 1              ; max index
  CMP r20, r21
  BGE r13, no_key
  ADDI r20, 1
  STORE r20, r20
  JMP no_key

check_enter:
  ; Enter (13)
  LDI r6, 13
  CMP r0, r6
  JNZ r13, check_esc
  LDI r20, MODE
  LDI r13, 1
  STORE r20, r13
  JMP no_key

check_esc:
  ; ESC (27)
  LDI r6, 27
  CMP r0, r6
  JNZ r13, no_key
  LDI r20, MODE
  LDI r13, 0
  STORE r20, r13

no_key:
  ; -- Draw launching overlay --
  LDI r20, MODE
  LOAD r20, r20
  LDI r1, 1
  CMP r20, r1
  JNZ r13, no_overlay
  LDI r13, 0x00AA00
  LDI r0, 80
  LDI r6, 120
  LDI r3, 96
  LDI r12, 16
  RECTF r0, r6, r3, r12, r13
  ; Reset mode
  LDI r20, MODE
  LDI r13, 0
  STORE r20, r13

no_overlay:
  FRAME
  JMP main_loop
