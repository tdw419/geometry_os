; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r8 = x position
;   r14 = y position
;   r4 = vx (velocity x)
;   r2 = vy (velocity y)
;   r6 = color (white)
;   r0 = scratch
;   r12 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r8, 32          ; start x = 32 (left half)
  LDI r14, 128         ; start y = 128
  LDI r4, 1           ; vx = +1
  LDI r2, 1           ; vy = +1
  LDI r6, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r12, red_proc
  SPAWN r12

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r0, 0
  PSET r8, r14, r0

  ; move
  ADD r8, r4
  ADD r14, r2

  ; bounce left wall (x = 0)
  LDI r0, 0
  CMP r8, r0
  JNZ r0, chk_rw
  LDI r4, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r0, 127
  CMP r8, r0
  JNZ r0, chk_tw
  LDI r4, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r0, 0
  CMP r14, r0
  JNZ r0, chk_bw
  LDI r2, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r0, 255
  CMP r14, r0
  JNZ r0, draw
  LDI r2, 0xFFFFFFFF

draw:
  PSET r8, r14, r6
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r8, 196         ; start x = 196 (right half)
  LDI r14, 64          ; start y = 64
  LDI r4, 0xFFFFFFFF          ; vx = -1
  LDI r2, 1           ; vy = +1
  LDI r6, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r0, 0
  PSET r8, r14, r0

  ; move
  ADD r8, r4
  ADD r14, r2

  ; bounce left wall of right half (x = 128)
  LDI r0, 128
  CMP r8, r0
  JNZ r0, red_chk_rw
  LDI r4, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r0, 255
  CMP r8, r0
  JNZ r0, red_chk_tw
  LDI r4, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r0, 0
  CMP r14, r0
  JNZ r0, red_chk_bw
  LDI r2, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r0, 255
  CMP r14, r0
  JNZ r0, red_draw
  LDI r2, 0xFFFFFFFF
red_draw:
  PSET r8, r14, r6
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
