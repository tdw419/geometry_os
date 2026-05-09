; DESCRIPTION: Draws a green rectangle at (476, 64) with width 32 and height 38.
; PLAN: r0=476(x), r1=64(y), r2=32(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 64
LDI r2, 32
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
