; DESCRIPTION: A colored object centered at the screen with fixed size.

; game_of_life.asm - Conway's Game of Life
; 64x64 grid, 4x4 pixel cells, covers full 256x256 screen
; PEEK reads neighbor pixels, RAM back buffer at 0x2000, RECTF renders
; The screen IS the cellular automaton -- pure pixel-driven-pixels

; ===== Constants =====
LDI r2, 1             ; constant 1
LDI r13, 64            ; GRID_SIZE
LDI r3, 0x00FF00     ; alive color (green)
LDI r10, 0x2000       ; back buffer base
LDI r25, 4            ; CELL_SIZE

; ===== Initialize Patterns =====

; Glider at grid (5,5) -> screen pixels at (gx*4, gy*4)
; .X.
; ..X
; XXX
PSETI 24, 20, 0x00FF00   ; (6,5) -> screen (24,20)
PSETI 28, 24, 0x00FF00   ; (7,6) -> screen (28,24)
PSETI 20, 28, 0x00FF00   ; (5,7) -> screen (20,28)
PSETI 24, 28, 0x00FF00   ; (6,7) -> screen (24,28)
PSETI 28, 28, 0x00FF00   ; (7,7) -> screen (28,28)

; Second glider at grid (50,5)
PSETI 204, 20, 0x00FF00  ; (51,5) -> screen (204,20)
PSETI 208, 24, 0x00FF00  ; (52,6) -> screen (208,24)
PSETI 200, 28, 0x00FF00  ; (50,7) -> screen (200,28)
PSETI 204, 28, 0x00FF00  ; (51,7) -> screen (204,28)
PSETI 208, 28, 0x00FF00  ; (52,7) -> screen (208,28)

; Blinker at grid (32,10) - horizontal oscillator
PSETI 128, 40, 0x00FF00  ; (32,10) -> screen (128,40)
PSETI 132, 40, 0x00FF00  ; (33,10) -> screen (132,40)
PSETI 136, 40, 0x00FF00  ; (34,10) -> screen (136,40)

; Block (still life) at grid (10,50)
PSETI 40, 200, 0x00FF00  ; (10,50) -> screen (40,200)
PSETI 44, 200, 0x00FF00  ; (11,50) -> screen (44,200)
PSETI 40, 204, 0x00FF00  ; (10,51) -> screen (40,204)
PSETI 44, 204, 0x00FF00  ; (11,51) -> screen (44,204)

; R-pentomino at grid (32,32) - chaotic methuselah
; .XX
; XX.
; .X.
PSETI 132, 128, 0x00FF00 ; (33,32) -> screen (132,128)
PSETI 136, 128, 0x00FF00 ; (34,32) -> screen (136,128)
PSETI 128, 132, 0x00FF00 ; (32,33) -> screen (128,132)
PSETI 132, 132, 0x00FF00 ; (33,33) -> screen (132,132)
PSETI 132, 136, 0x00FF00 ; (33,34) -> screen (132,136)

; Beacon at grid (48,48) - period 2 oscillator
; XX..
; XX..
; ..XX
; ..XX
PSETI 192, 192, 0x00FF00 ; (48,48)
PSETI 196, 192, 0x00FF00 ; (49,48)
PSETI 192, 196, 0x00FF00 ; (48,49)
PSETI 196, 196, 0x00FF00 ; (49,49)
PSETI 200, 200, 0x00FF00 ; (50,50)
PSETI 204, 200, 0x00FF00 ; (51,50)
PSETI 200, 204, 0x00FF00 ; (50,51)
PSETI 204, 204, 0x00FF00 ; (51,51)

; ===== Main Generation Loop =====
gen_loop:

; --- Phase 1: Compute next generation into back buffer ---
; For each cell (x,y), count 8 neighbors via PEEK, apply Conway's rules,
; write result (0 or 1) to RAM back buffer at 0x2000 + y*64 + x

LDI r14, 0             ; y = 0

comp_y:
  LDI r8, 0           ; x = 0

  comp_x:
    ; Screen coordinates: screen_x = x * 4, screen_y = y * 4
    MOV r9, r8
    LDI r0, 2
    SHL r9, r0         ; r9 = screen_x = x << 2
    MOV r7, r14
    SHL r7, r0         ; r7 = screen_y = y << 2

    ; Back buffer address: 0x2000 + y*64 + x
    MOV r6, r14
    MUL r6, r13        ; r6 = y * 64
    ADD r6, r8        ; r6 = y*64 + x
    ADD r6, r10       ; r6 = 0x2000 + y*64 + x

    ; Read current cell state from screen
    PEEK r9, r7, r4    ; r4 = pixel at (screen_x, screen_y)

    ; Precompute neighbor screen coordinates (±CELL_SIZE = ±4)
    MOV r20, r9
    SUB r20, r25        ; r20 = screen_x - 4 (left neighbor column)
    MOV r21, r9
    ADD r21, r25        ; r21 = screen_x + 4 (right neighbor column)
    MOV r22, r7
    SUB r22, r25        ; r22 = screen_y - 4 (top neighbor row)
    MOV r23, r7
    ADD r23, r25        ; r23 = screen_y + 4 (bottom neighbor row)

    ; Count live neighbors (PEEK each, increment if non-zero)
    LDI r5, 0           ; neighbor count = 0

    PEEK r20, r22, r15   ; top-left     (-1,-1)
    JZ r15, cn1
    ADD r5, r2
    cn1:

    PEEK r20, r7, r15    ; left         (-1, 0)
    JZ r15, cn2
    ADD r5, r2
    cn2:

    PEEK r20, r23, r15   ; bottom-left  (-1,+1)
    JZ r15, cn3
    ADD r5, r2
    cn3:

    PEEK r9, r22, r15    ; top          ( 0,-1)
    JZ r15, cn4
    ADD r5, r2
    cn4:

    PEEK r9, r23, r15    ; bottom       ( 0,+1)
    JZ r15, cn5
    ADD r5, r2
    cn5:

    PEEK r21, r22, r15   ; top-right    (+1,-1)
    JZ r15, cn6
    ADD r5, r2
    cn6:

    PEEK r21, r7, r15    ; right        (+1, 0)
    JZ r15, cn7
    ADD r5, r2
    cn7:

    PEEK r21, r23, r15   ; bottom-right (+1,+1)
    JZ r15, cn8
    ADD r5, r2
    cn8:

    ; Conway's rules: alive if neighbors==3 OR (alive AND neighbors==2)
    MOV r0, r5
    LDI r15, 3
    SUB r0, r15          ; r0 = neighbors - 3
    JZ r0, gol_alive    ; n==3 -> always alive (birth or survival)

    JZ r4, gol_dead    ; dead + n!=3 -> stays dead

    MOV r0, r5
    LDI r15, 2
    SUB r0, r15          ; r0 = neighbors - 2
    JZ r0, gol_alive    ; alive + n==2 -> survives

    ; alive + (n<2 or n>3) -> dies
    gol_dead:
      LDI r0, 0
      STORE r6, r0
      JMP cx_next

    gol_alive:
      LDI r0, 1
      STORE r6, r0

  cx_next:
    ADD r8, r2          ; x++
    MOV r0, r8
    SUB r0, r13          ; x - 64
    JZ r0, cy_next      ; row done
    JMP comp_x

cy_next:
  ADD r14, r2            ; y++
  MOV r0, r14
  SUB r0, r13            ; y - 64
  JZ r0, do_render      ; grid done
  JMP comp_y

; --- Phase 2: Render back buffer to screen ---
do_render:
  LDI r0, 0
  FILL r0               ; clear screen to black

  LDI r14, 0             ; y = 0

  rend_y:
    LDI r8, 0           ; x = 0

    rend_x:
      ; Back buffer address
      MOV r6, r14
      MUL r6, r13       ; y * 64
      ADD r6, r8       ; + x
      ADD r6, r10      ; + 0x2000

      ; Load cell state from back buffer
      LOAD r0, r6
      JZ r0, rend_xn    ; dead cell -> skip

      ; Alive: draw 4x4 rectangle at grid position
      MOV r9, r8
      LDI r0, 2
      SHL r9, r0        ; screen_x = x * 4
      MOV r7, r14
      SHL r7, r0        ; screen_y = y * 4
      RECTF r9, r7, r25, r25, r3

    rend_xn:
      ADD r8, r2        ; x++
      MOV r0, r8
      SUB r0, r13        ; x - 64
      JZ r0, rend_yn
      JMP rend_x

    rend_yn:
      ADD r14, r2        ; y++
      MOV r0, r14
      SUB r0, r13        ; y - 64
      JZ r0, frame_done
      JMP rend_y

frame_done:
  FRAME
  JMP gen_loop
