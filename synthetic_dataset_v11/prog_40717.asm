; DESCRIPTION: Draws a magenta rectangle at (124, 88) with width 91 and height 86.
; PLAN: r0=124(x), r1=88(y), r2=91(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 88
LDI r2, 91
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
