; DESCRIPTION: Draws a magenta rectangle at (185, 24) with width 32 and height 114.
; PLAN: r0=185(x), r1=24(y), r2=32(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 24
LDI r2, 32
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
