; DESCRIPTION: Draws a magenta rectangle at (280, 145) with width 32 and height 94.
; PLAN: r0=280(x), r1=145(y), r2=32(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 145
LDI r2, 32
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
