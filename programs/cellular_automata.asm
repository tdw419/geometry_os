; cellular_automata.asm - Multi-rule cellular automata sandbox
; 64x64 grid, 4x4 pixel cells, covers full 256x256 screen
; Rules: Conway's Life (B3/S23), HighLife (B36/S23), Seeds (B2/S), DayAndNight (B3678/S34678)
; Controls: 1=Life  2=HighLife  3=Seeds  4=DayAndNight  R=Random  C=Clear  Space=Pause
;
; Memory Map:
;   0x2000-0x2FFF  back buffer (64x64 = 4096 cells, 0=dead 1=alive)
;   0x3000         birth_mask (bitfield: bit N = birth on N neighbors)
;   0x3001         survival_mask (bitfield: bit N = survive on N neighbors)
;   0x3002         current_rule (0=Life, 1=HighLife, 2=Seeds, 3=DayAndNight)
;   0x3003         paused flag (0=running, 1=paused)
;   0x3004         generation counter
;   0x3005         alive_color
;   0x4000         string: "LIFE B3/S23"
;   0x4020         string: "HIGHLIFE B36/S"
;   0x4040         string: "SEEDS B2/S"
;   0x4060         string: "DAYNIGHT B3678/S34678"
;   0x4080         string: "PAUSED"

; ===== Constants =====
LDI r7, 1
LDI r9, 64
LDI r13, 0x2000
LDI r25, 4
LDI r26, 0x3000
LDI r27, 0xFFE

; ===== Initialize Rule (Conway's Life B3/S23) =====
LDI r4, 0x08
STORE r26, r4
LDI r4, 0x0C
LDI r5, 0x3001
STORE r5, r4
LDI r4, 0
LDI r5, 0x3002
STORE r5, r4
LDI r4, 0
LDI r5, 0x3003
STORE r5, r4
LDI r4, 0
LDI r5, 0x3004
STORE r5, r4
LDI r4, 0x00FF00
LDI r5, 0x3005
STORE r5, r4

; ===== String Data =====
LDI r15, 0x4000
STRO r15, "LIFE B3/S23"
LDI r15, 0x4020
STRO r15, "HIGHLIFE B36/S"
LDI r15, 0x4040
STRO r15, "SEEDS B2/S"
LDI r15, 0x4060
STRO r15, "DAYNIGHT B3678/S34678"
LDI r15, 0x4080
STRO r15, "PAUSED"

; ===== Initial Patterns =====
; R-pentomino at grid (32,32) - chaotic methuselah
PSETI 128, 128, 0x00FF00
PSETI 132, 128, 0x00FF00
PSETI 124, 132, 0x00FF00
PSETI 128, 132, 0x00FF00
PSETI 128, 136, 0x00FF00

; Glider at grid (5,5)
PSETI 24, 20, 0x00FF00
PSETI 24, 24, 0x00FF00
PSETI 20, 28, 0x00FF00
PSETI 24, 28, 0x00FF00
PSETI 28, 28, 0x00FF00

; Block at grid (10,50) - still life
PSETI 40, 200, 0x00FF00
PSETI 44, 200, 0x00FF00
PSETI 40, 204, 0x00FF00
PSETI 44, 204, 0x00FF00

; Blinker at grid (50,5) - period 2 oscillator
PSETI 200, 20, 0x00FF00
PSETI 204, 20, 0x00FF00
PSETI 208, 20, 0x00FF00

; Acorn at grid (15,30) - methuselah (5206 gens)
PSETI 60, 120, 0x00FF00
PSETI 64, 120, 0x00FF00
PSETI 68, 120, 0x00FF00
PSETI 72, 120, 0x00FF00
PSETI 72, 124, 0x00FF00
PSETI 76, 120, 0x00FF00
PSETI 80, 120, 0x00FF00

; ===== Precompute survival mask address =====
MOV r28, r26
ADD r28, r7

; ===== Main Loop =====
main_loop:

; --- Input ---
IKEY r10
JZ r10, input_done

LDI r4, 49
CMP r10, r4
JZ r0, set_life

LDI r4, 50
CMP r10, r4
JZ r0, set_highlife

LDI r4, 51
CMP r10, r4
JZ r0, set_seeds

LDI r4, 52
CMP r10, r4
JZ r0, set_daynight

LDI r4, 82
CMP r10, r4
JZ r0, do_random

LDI r4, 67
CMP r10, r4
JZ r0, do_clear

LDI r4, 32
CMP r10, r4
JZ r0, toggle_pause

JMP input_done

set_life:
  LDI r4, 0x08
  STORE r26, r4
  LDI r4, 0x0C
  STORE r28, r4
  LDI r4, 0
  LDI r5, 0x3002
  STORE r5, r4
  LDI r4, 0x00FF00
  LDI r5, 0x3005
  STORE r5, r4
  JMP input_done

set_highlife:
  LDI r4, 0x48
  STORE r26, r4
  LDI r4, 0x0C
  STORE r28, r4
  LDI r4, 1
  LDI r5, 0x3002
  STORE r5, r4
  LDI r4, 0x00FFFF
  LDI r5, 0x3005
  STORE r5, r4
  JMP input_done

set_seeds:
  LDI r4, 0x04
  STORE r26, r4
  LDI r4, 0x00
  STORE r28, r4
  LDI r4, 2
  LDI r5, 0x3002
  STORE r5, r4
  LDI r4, 0xFF8800
  LDI r5, 0x3005
  STORE r5, r4
  JMP input_done

set_daynight:
  LDI r4, 0x01C8
  STORE r26, r4
  LDI r4, 0x01D8
  STORE r28, r4
  LDI r4, 3
  LDI r5, 0x3002
  STORE r5, r4
  LDI r4, 0xFF00FF
  LDI r5, 0x3005
  STORE r5, r4
  JMP input_done

do_random:
  PUSH r31
  CALL random_fill
  POP r31
  LDI r4, 0
  LDI r5, 0x3003
  STORE r5, r4
  JMP input_done

do_clear:
  LDI r4, 0
  FILL r4
  LDI r15, 0x2000
  LDI r2, 0
  LDI r3, 4096
clr_loop:
  LDI r4, 0
  STORE r15, r4
  ADD r15, r7
  ADD r2, r7
  MOV r6, r2
  SUB r6, r3
  JZ r6, clr_done
  JMP clr_loop
clr_done:
  LDI r4, 0
  LDI r5, 0x3004
  STORE r5, r4
  JMP input_done

toggle_pause:
  LDI r5, 0x3003
  LOAD r4, r5
  LDI r6, 1
  XOR r4, r6
  STORE r5, r4

input_done:

; --- Pause Check ---
LDI r5, 0x3003
LOAD r4, r5
JNZ r4, do_render

; --- Throttle (every 4th frame) ---
LOAD r4, r27
LDI r6, 3
AND r4, r6
JNZ r4, do_render

; --- Compute Next Generation ---
LDI r2, 0

comp_y:
  LDI r1, 0

  comp_x:
    ; screen coords (top-left of 4x4 cell)
    MOV r3, r1
    LDI r6, 2
    SHL r3, r6
    MOV r4, r2
    SHL r4, r6

    ; PEEK current cell at top-left
    PEEK r3, r4, r14

    ; neighbor count
    LDI r5, 0

    ; neighbor offsets (4 pixels = one cell width)
    LDI r6, 4
    MOV r20, r3
    SUB r20, r6
    MOV r21, r3
    ADD r21, r6
    MOV r22, r4
    SUB r22, r6
    MOV r23, r4
    ADD r23, r6

    ; 8 neighbors (r3=screen_x, r4=screen_y preserved)
    PEEK r20, r22, r8
    JZ r8, cn1
    ADD r5, r7
cn1:
    PEEK r3, r22, r8
    JZ r8, cn2
    ADD r5, r7
cn2:
    PEEK r21, r22, r8
    JZ r8, cn3
    ADD r5, r7
cn3:
    PEEK r20, r4, r8
    JZ r8, cn4
    ADD r5, r7
cn4:
    PEEK r21, r4, r8
    JZ r8, cn5
    ADD r5, r7
cn5:
    PEEK r20, r23, r8
    JZ r8, cn6
    ADD r5, r7
cn6:
    PEEK r3, r23, r8
    JZ r8, cn7
    ADD r5, r7
cn7:
    PEEK r21, r23, r8
    JZ r8, cn8
    ADD r5, r7
cn8:

    ; apply rule via bitfield masks
    JNZ r14, check_survive

    ; dead cell - check birth mask
    LOAD r6, r26
    SHR r6, r5
    AND r6, r7
    JZ r6, cell_dead
    JMP cell_write

check_survive:
    ; alive cell - check survival mask
    LOAD r6, r28
    SHR r6, r5
    AND r6, r7
    JZ r6, cell_dead
    JMP cell_write

cell_dead:
    LDI r6, 0

cell_write:
    MOV r15, r2
    MUL r15, r9
    ADD r15, r1
    ADD r15, r13
    STORE r15, r6

    ADD r1, r7
    MOV r6, r1
    SUB r6, r9
    JZ r6, cy_next
    JMP comp_x

cy_next:
  ADD r2, r7
  MOV r6, r2
  SUB r6, r9
  JZ r6, inc_gen
  JMP comp_y

inc_gen:
  LDI r5, 0x3004
  LOAD r4, r5
  ADD r4, r7
  STORE r5, r4

; --- Render ---
do_render:
  LDI r6, 0
  FILL r6
  LDI r5, 0x3005
  LOAD r16, r5

  LDI r2, 0

rend_y:
  LDI r1, 0

  rend_x:
    MOV r15, r2
    MUL r15, r9
    ADD r15, r1
    ADD r15, r13
    LOAD r6, r15
    JZ r6, rend_xn

    MOV r3, r1
    LDI r6, 2
    SHL r3, r6
    MOV r4, r2
    SHL r4, r6
    RECTF r3, r4, r25, r25, r16

rend_xn:
    ADD r1, r7
    MOV r6, r1
    SUB r6, r9
    JZ r6, rend_yn
    JMP rend_x

rend_yn:
  ADD r2, r7
  MOV r6, r2
  SUB r6, r9
  JZ r6, draw_hud
  JMP rend_y

draw_hud:
  ; determine rule string
  LDI r5, 0x3002
  LOAD r6, r5
  JZ r6, hud_life
  LDI r4, 1
  CMP r6, r4
  JZ r0, hud_hl
  LDI r4, 2
  CMP r6, r4
  JZ r0, hud_seeds
  JMP hud_daynight

hud_daynight:
  LDI r10, 0x4060
  JMP hud_show

hud_life:
  LDI r10, 0x4000
  JMP hud_show

hud_hl:
  LDI r10, 0x4020
  JMP hud_show

hud_seeds:
  LDI r10, 0x4040
  JMP hud_show

hud_show:
  LDI r11, 2
  LDI r12, 2
  TEXT r11, r12, r10

  ; paused indicator
  LDI r5, 0x3003
  LOAD r6, r5
  JZ r6, frame_out
  LDI r10, 0x4080
  LDI r11, 2
  LDI r12, 12
  TEXT r11, r12, r10

frame_out:
  FRAME
  JMP main_loop

; ===== Random Fill Subroutine =====
random_fill:
  LDI r2, 0

rf_y:
  LDI r1, 0

  rf_x:
    RAND r3
    LDI r6, 0xFF
    AND r3, r6
    LDI r6, 50
    CMP r3, r6
    BLT r0, rf_alive
    JMP rf_xn

rf_alive:
    MOV r3, r1
    LDI r6, 2
    SHL r3, r6
    MOV r4, r2
    SHL r4, r6
    LDI r5, 0x3005
    LOAD r6, r5
    RECTF r3, r4, r25, r25, r6

rf_xn:
    ADD r1, r7
    MOV r3, r1
    SUB r3, r9
    JZ r3, rf_yn
    JMP rf_x

rf_yn:
  ADD r2, r7
  MOV r3, r2
  SUB r3, r9
  JZ r3, rf_done
  JMP rf_y

rf_done:
  RET
