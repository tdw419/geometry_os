; DESCRIPTION: Render a colored object at the screen.

; game_of_life.asm - Conway's Game of Life
; 64x64 grid, 4x4 pixel cells, covers full 256x256 screen
; PEEK reads neighbor pixels, RAM back buffer at 0x2000, RECTF renders
; The screen IS the cellular automaton -- pure pixel-driven-pixels

; ===== Constants =====
LDI r8, 1             ; constant 1
LDI r9, 64            ; GRID_SIZE
LDI r10, 0x00FF00     ; alive color (green)
LDI r1, 0x2000       ; back buffer base
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

LDI r7, 0             ; y = 0

comp_y:
  LDI r4, 0           ; x = 0

  comp_x:
    ; Screen coordinates: screen_x = x * 4, screen_y = y * 4
    MOV r2, r4
    LDI r11, 2
    SHL r2, r11         ; r2 = screen_x = x << 2
    MOV r6, r7
    SHL r6, r11         ; r6 = screen_y = y << 2

    ; Back buffer address: 0x2000 + y*64 + x
    MOV r5, r7
    MUL r5, r9        ; r5 = y * 64
    ADD r5, r4        ; r5 = y*64 + x
    ADD r5, r1       ; r5 = 0x2000 + y*64 + x

    ; Read current cell state from screen
    PEEK r2, r6, r12    ; r12 = pixel at (screen_x, screen_y)

    ; Precompute neighbor screen coordinates (±CELL_SIZE = ±4)
    MOV r20, r2
    SUB r20, r25        ; r20 = screen_x - 4 (left neighbor column)
    MOV r21, r2
    ADD r21, r25        ; r21 = screen_x + 4 (right neighbor column)
    MOV r22, r6
    SUB r22, r25        ; r22 = screen_y - 4 (top neighbor row)
    MOV r23, r6
    ADD r23, r25        ; r23 = screen_y + 4 (bottom neighbor row)

    ; Count live neighbors (PEEK each, increment if non-zero)
    LDI r14, 0           ; neighbor count = 0

    PEEK r20, r22, r0   ; top-left     (-1,-1)
    JZ r0, cn1
    ADD r14, r8
    cn1:

    PEEK r20, r6, r0    ; left         (-1, 0)
    JZ r0, cn2
    ADD r14, r8
    cn2:

    PEEK r20, r23, r0   ; bottom-left  (-1,+1)
    JZ r0, cn3
    ADD r14, r8
    cn3:

    PEEK r2, r22, r0    ; top          ( 0,-1)
    JZ r0, cn4
    ADD r14, r8
    cn4:

    PEEK r2, r23, r0    ; bottom       ( 0,+1)
    JZ r0, cn5
    ADD r14, r8
    cn5:

    PEEK r21, r22, r0   ; top-right    (+1,-1)
    JZ r0, cn6
    ADD r14, r8
    cn6:

    PEEK r21, r6, r0    ; right        (+1, 0)
    JZ r0, cn7
    ADD r14, r8
    cn7:

    PEEK r21, r23, r0   ; bottom-right (+1,+1)
    JZ r0, cn8
    ADD r14, r8
    cn8:

    ; Conway's rules: alive if neighbors==3 OR (alive AND neighbors==2)
    MOV r11, r14
    LDI r0, 3
    SUB r11, r0          ; r11 = neighbors - 3
    JZ r11, gol_alive    ; n==3 -> always alive (birth or survival)

    JZ r12, gol_dead    ; dead + n!=3 -> stays dead

    MOV r11, r14
    LDI r0, 2
    SUB r11, r0          ; r11 = neighbors - 2
    JZ r11, gol_alive    ; alive + n==2 -> survives

    ; alive + (n<2 or n>3) -> dies
    gol_dead:
      LDI r11, 0
      STORE r5, r11
      JMP cx_next

    gol_alive:
      LDI r11, 1
      STORE r5, r11

  cx_next:
    ADD r4, r8          ; x++
    MOV r11, r4
    SUB r11, r9          ; x - 64
    JZ r11, cy_next      ; row done
    JMP comp_x

cy_next:
  ADD r7, r8            ; y++
  MOV r11, r7
  SUB r11, r9            ; y - 64
  JZ r11, do_render      ; grid done
  JMP comp_y

; --- Phase 2: Render back buffer to screen ---
do_render:
  LDI r11, 0
  FILL r11               ; clear screen to black

  LDI r7, 0             ; y = 0

  rend_y:
    LDI r4, 0           ; x = 0

    rend_x:
      ; Back buffer address
      MOV r5, r7
      MUL r5, r9       ; y * 64
      ADD r5, r4       ; + x
      ADD r5, r1      ; + 0x2000

      ; Load cell state from back buffer
      LOAD r11, r5
      JZ r11, rend_xn    ; dead cell -> skip

      ; Alive: draw 4x4 rectangle at grid position
      MOV r2, r4
      LDI r11, 2
      SHL r2, r11        ; screen_x = x * 4
      MOV r6, r7
      SHL r6, r11        ; screen_y = y * 4
      RECTF r2, r6, r25, r25, r10

    rend_xn:
      ADD r4, r8        ; x++
      MOV r11, r4
      SUB r11, r9        ; x - 64
      JZ r11, rend_yn
      JMP rend_x

    rend_yn:
      ADD r7, r8        ; y++
      MOV r11, r7
      SUB r11, r9        ; y - 64
      JZ r11, frame_done
      JMP rend_y

frame_done:
  FRAME
  JMP gen_loop
