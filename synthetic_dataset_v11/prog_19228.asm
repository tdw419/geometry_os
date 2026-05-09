; DESCRIPTION: Draws a magenta rectangle at (195, 32) with width 14 and height 64.
; PLAN: r0=195(x), r1=32(y), r2=14(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 32
LDI r2, 14
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
