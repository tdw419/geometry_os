; DESCRIPTION: Draws a magenta rectangle at (124, 192) with width 117 and height 20.
; PLAN: r0=124(x), r1=192(y), r2=117(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 192
LDI r2, 117
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
