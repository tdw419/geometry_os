; MAZE GRID -- Draw a maze-like grid pattern using nested loops
; Creates walls on a dark background using RECTF in a pattern
; Wall color: dark green on near-black background

; Fill background dark
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x0A0A14
FILL r4

; Draw horizontal maze walls
; Grid: 16 cells, each 16px. Walls are 2px thick.
; Outer border
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 2
LDI r4, 0x00CC44
RECTF r0, r1, r2, r3, r4

; Bottom border
LDI r1, 254
RECTF r0, r1, r2, r3, r4

; Left border
LDI r0, 0
LDI r1, 0
LDI r2, 2
LDI r3, 256
RECTF r0, r1, r2, r3, r4

; Right border
LDI r0, 254
RECTF r0, r1, r2, r3, r4

; Draw internal horizontal walls at y = 32, 64, 96, 128, 160, 192, 224
; Each wall has gaps (passages) at pseudo-random x positions
; y=32: walls 0-64, 96-192, 224-256
LDI r4, 0x00CC44
LDI r5, 2          ; wall thickness
LDI r6, 0x0A0A14   ; background (for erasing gaps)

; --- Row y=32 ---
LDI r1, 32
LDI r0, 0
LDI r2, 64
LDI r3, 2
RECTF r0, r1, r2, r3, r4
LDI r0, 96
LDI r2, 96
RECTF r0, r1, r2, r3, r4
LDI r0, 224
LDI r2, 32
RECTF r0, r1, r2, r3, r4

; --- Row y=64 ---
LDI r1, 64
LDI r0, 0
LDI r2, 128
RECTF r0, r1, r2, r3, r4
LDI r0, 160
LDI r2, 96
RECTF r0, r1, r2, r3, r4

; --- Row y=96 ---
LDI r1, 96
LDI r0, 0
LDI r2, 32
RECTF r0, r1, r2, r3, r4
LDI r0, 48
LDI r2, 16
RECTF r0, r1, r2, r3, r4
LDI r0, 96
LDI r2, 64
RECTF r0, r1, r2, r3, r4
LDI r0, 192
LDI r2, 64
RECTF r0, r1, r2, r3, r4

; --- Row y=128 ---
LDI r1, 128
LDI r0, 0
LDI r2, 96
RECTF r0, r1, r2, r3, r4
LDI r0, 128
LDI r2, 128
RECTF r0, r1, r2, r3, r4

; --- Row y=160 ---
LDI r1, 160
LDI r0, 0
LDI r2, 48
RECTF r0, r1, r2, r3, r4
LDI r0, 80
LDI r2, 48
RECTF r0, r1, r2, r3, r4
LDI r0, 160
LDI r2, 96
RECTF r0, r1, r2, r3, r4

; --- Row y=192 ---
LDI r1, 192
LDI r0, 0
LDI r2, 64
RECTF r0, r1, r2, r3, r4
LDI r0, 96
LDI r2, 96
RECTF r0, r1, r2, r3, r4
LDI r0, 224
LDI r2, 32
RECTF r0, r1, r2, r3, r4

; --- Row y=224 ---
LDI r1, 224
LDI r0, 0
LDI r2, 160
RECTF r0, r1, r2, r3, r4
LDI r0, 192
LDI r2, 64
RECTF r0, r1, r2, r3, r4

; Draw internal vertical walls
LDI r3, 32         ; segment height

; --- Col x=32 ---
LDI r0, 32
LDI r1, 0
LDI r2, 2
LDI r3, 32
RECTF r0, r1, r2, r3, r4
LDI r1, 64
LDI r3, 64
RECTF r0, r1, r2, r3, r4
LDI r1, 160
LDI r3, 64
RECTF r0, r1, r2, r3, r4

; --- Col x=64 ---
LDI r0, 64
LDI r1, 32
LDI r3, 32
RECTF r0, r1, r2, r3, r4
LDI r1, 96
LDI r3, 64
RECTF r0, r1, r2, r3, r4
LDI r1, 192
LDI r3, 64
RECTF r0, r1, r2, r3, r4

; --- Col x=96 ---
LDI r0, 96
LDI r1, 0
LDI r3, 64
RECTF r0, r1, r2, r3, r4
LDI r1, 96
LDI r3, 32
RECTF r0, r1, r2, r3, r4
LDI r1, 160
LDI r3, 96
RECTF r0, r1, r2, r3, r4

; --- Col x=128 ---
LDI r0, 128
LDI r1, 32
LDI r3, 64
RECTF r0, r1, r2, r3, r4
LDI r1, 128
LDI r3, 32
RECTF r0, r1, r2, r3, r4
LDI r1, 192
LDI r3, 64
RECTF r0, r1, r2, r3, r4

; --- Col x=160 ---
LDI r0, 160
LDI r1, 0
LDI r3, 96
RECTF r0, r1, r2, r3, r4
LDI r1, 128
LDI r3, 64
RECTF r0, r1, r2, r3, r4

; --- Col x=192 ---
LDI r0, 192
LDI r1, 64
LDI r3, 64
RECTF r0, r1, r2, r3, r4
LDI r1, 160
LDI r3, 32
RECTF r0, r1, r2, r3, r4
LDI r1, 224
LDI r3, 32
RECTF r0, r1, r2, r3, r4

; --- Col x=224 ---
LDI r0, 224
LDI r1, 0
LDI r3, 32
RECTF r0, r1, r2, r3, r4
LDI r1, 64
LDI r3, 96
RECTF r0, r1, r2, r3, r4
LDI r1, 192
LDI r3, 64
RECTF r0, r1, r2, r3, r4

; Mark start (green dot) and end (red dot)
LDI r0, 128
LDI r1, 8
LDI r2, 6
LDI r4, 0x00FF00
CIRCLE r0, r1, r2, r4

LDI r0, 128
LDI r1, 248
LDI r2, 6
LDI r4, 0xFF0000
CIRCLE r0, r1, r2, r4

HALT
