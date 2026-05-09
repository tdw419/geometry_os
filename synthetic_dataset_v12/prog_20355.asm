; DESCRIPTION: Draws a yellow rectangle at (106, 72) with width 80 and height 87.
; PLAN: r0=106(x), r1=72(y), r2=80(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 72
LDI r2, 80
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
