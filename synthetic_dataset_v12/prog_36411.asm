; DESCRIPTION: Draws a magenta rectangle at (149, 112) with width 86 and height 80.
; PLAN: r0=149(x), r1=112(y), r2=86(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 112
LDI r2, 86
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
