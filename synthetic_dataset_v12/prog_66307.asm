; DESCRIPTION: Draws a magenta rectangle at (254, 31) with width 32 and height 107.
; PLAN: r0=254(x), r1=31(y), r2=32(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 31
LDI r2, 32
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
