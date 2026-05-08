; DESCRIPTION: Render a red object at the screen.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r3 = x position
;   r14 = y position
;   r4 = vx (velocity x)
;   r9 = vy (velocity y)
;   r15 = color (white)
;   r6 = scratch
;   r12 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r3, 32          ; start x = 32 (left half)
  LDI r14, 128         ; start y = 128
  LDI r4, 1           ; vx = +1
  LDI r9, 1           ; vy = +1
  LDI r15, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r12, red_proc
  SPAWN r12

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r6, 0
  PSET r3, r14, r6

  ; move
  ADD r3, r4
  ADD r14, r9

  ; bounce left wall (x = 0)
  LDI r6, 0
  CMP r3, r6
  JNZ r6, chk_rw
  LDI r4, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r6, 127
  CMP r3, r6
  JNZ r6, chk_tw
  LDI r4, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r6, 0
  CMP r14, r6
  JNZ r6, chk_bw
  LDI r9, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r6, 255
  CMP r14, r6
  JNZ r6, draw
  LDI r9, 0xFFFFFFFF

draw:
  PSET r3, r14, r15
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r3, 196         ; start x = 196 (right half)
  LDI r14, 64          ; start y = 64
  LDI r4, 0xFFFFFFFF          ; vx = -1
  LDI r9, 1           ; vy = +1
  LDI r15, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r6, 0
  PSET r3, r14, r6

  ; move
  ADD r3, r4
  ADD r14, r9

  ; bounce left wall of right half (x = 128)
  LDI r6, 128
  CMP r3, r6
  JNZ r6, red_chk_rw
  LDI r4, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r6, 255
  CMP r3, r6
  JNZ r6, red_chk_tw
  LDI r4, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r6, 0
  CMP r14, r6
  JNZ r6, red_chk_bw
  LDI r9, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r6, 255
  CMP r14, r6
  JNZ r6, red_draw
  LDI r9, 0xFFFFFFFF
red_draw:
  PSET r3, r14, r15
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
