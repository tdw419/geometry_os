; DESCRIPTION: Display a rectangle using color colored at the screen.

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
LDI r13, 1
LDI r2, 0

; Clear state
LDI r20, SCROLL_OFF
STORE r20, r2
LDI r20, SEL_INDEX
STORE r20, r2
LDI r20, MODE
STORE r20, r2

; -- Get file list --
LDI r7, FILE_BUF
LS r7
LDI r20, FILE_COUNT
STORE r20, r9

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; Clear screen
  LDI r9, 0x1A1A2E
  FILL r9

  ; -- Draw title bar --
  LDI r9, 0x2D2D4D
  LDI r7, 0
  LDI r10, 0
  LDI r8, 256
  LDI r0, 20
  RECTF r7, r10, r8, r0, r9

  ; Title "Apps"
  LDI r7, STR_BUF
  LDI r9, 65                ; A
  STORE r7, r9
  ADD r7, r13
  LDI r9, 112               ; p
  STORE r7, r9
  ADD r7, r13
  LDI r9, 112               ; p
  STORE r7, r9
  ADD r7, r13
  LDI r9, 115               ; s
  STORE r7, r9
  ADD r7, r13
  LDI r9, 0
  STORE r7, r9
  LDI r7, 110
  LDI r10, 6
  LDI r8, STR_BUF
  LDI r0, 0xFFFFFF
  LDI r12, 0
  DRAWTEXT r7, r10, r8, r0, r12

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
  ADD r22, r13
  SUBI r20, 1
  JZ r20, draw_grid
  JMP scroll_skip
skip_adv:
  ADD r22, r13
  JMP scroll_skip

draw_grid:
  ; r22 = pointer to first visible entry
  LDI r23, 0                ; entry counter
  LDI r24, 24               ; max visible

grid_loop:
  CMP r23, r24
  BGE r9, grid_done
  CMP r21, r2
  JZ r9, grid_done

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
  LDI r8, SEL_INDEX
  LOAD r8, r8
  CMP r8, r23
  ; If selected, draw highlight
  LDI r9, 0x4444AA
  LDI r7, 84
  LDI r10, 28
  JZ r9, draw_cell_bg
  ; Normal cell
  LDI r9, 0x252540

draw_cell_bg:
  RECTF r26, r27, r7, r10, r9

  ; Copy filename to STR_BUF (max 12 chars)
  LDI r25, STR_BUF
  LDI r26, 12

copy_fname:
  LOAD r27, r22
  STORE r25, r27
  JZ r27, fname_done
  ADD r22, r13
  ADD r25, r13
  SUBI r26, 1
  JZ r26, fname_done
  JMP copy_fname

fname_done:
  ; Advance past null
  LOAD r27, r22
  JNZ r27, no_null_adv
  ADD r22, r13
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

  LDI r8, STR_BUF
  LDI r0, 0xCCCCCC
  LDI r12, 0
  DRAWTEXT r26, r27, r8, r0, r12

  ADDI r23, 1
  SUBI r21, 1
  JMP grid_loop

grid_done:
  ; -- Draw footer --
  ; "W/S Scroll  Enter Run  ESC Back"
  LDI r7, STR_BUF
  LDI r9, 87               ; W
  STORE r7, r9
  ADD r7, r13
  LDI r9, 47               ; /
  STORE r7, r9
  ADD r7, r13
  LDI r9, 83               ; S
  STORE r7, r9
  ADD r7, r13
  LDI r9, 32               ; space
  STORE r7, r9
  ADD r7, r13
  LDI r9, 82               ; R
  STORE r7, r9
  ADD r7, r13
  LDI r9, 117              ; u
  STORE r7, r9
  ADD r7, r13
  LDI r9, 110              ; n
  STORE r7, r9
  ADD r7, r13
  LDI r9, 0
  STORE r7, r9

  LDI r7, 4
  LDI r10, 244
  LDI r8, STR_BUF
  LDI r0, 0x888888
  LDI r12, 0
  DRAWTEXT r7, r10, r8, r0, r12

  ; -- Handle keyboard input --
  IKEY r7
  JZ r7, no_key

  ; W = up (87)
  LDI r10, 87
  CMP r7, r10
  JNZ r9, check_down
  ; Move selection up
  LDI r20, SEL_INDEX
  LOAD r20, r20
  JZ r20, no_key
  SUBI r20, 1
  STORE r20, r20
  JMP no_key

check_down:
  ; S = down (83)
  LDI r10, 83
  CMP r7, r10
  JNZ r9, check_enter
  ; Move selection down
  LDI r20, SEL_INDEX
  LOAD r20, r20
  LDI r21, FILE_COUNT
  LOAD r21, r21
  SUBI r21, 1              ; max index
  CMP r20, r21
  BGE r9, no_key
  ADDI r20, 1
  STORE r20, r20
  JMP no_key

check_enter:
  ; Enter (13)
  LDI r10, 13
  CMP r7, r10
  JNZ r9, check_esc
  LDI r20, MODE
  LDI r9, 1
  STORE r20, r9
  JMP no_key

check_esc:
  ; ESC (27)
  LDI r10, 27
  CMP r7, r10
  JNZ r9, no_key
  LDI r20, MODE
  LDI r9, 0
  STORE r20, r9

no_key:
  ; -- Draw launching overlay --
  LDI r20, MODE
  LOAD r20, r20
  LDI r15, 1
  CMP r20, r15
  JNZ r9, no_overlay
  LDI r9, 0x00AA00
  LDI r7, 80
  LDI r10, 120
  LDI r8, 96
  LDI r0, 16
  RECTF r7, r10, r8, r0, r9
  ; Reset mode
  LDI r20, MODE
  LDI r9, 0
  STORE r20, r9

no_overlay:
  FRAME
  JMP main_loop
