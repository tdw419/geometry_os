; DESCRIPTION: Draws a yellow rectangle at (337, 110) with width 117 and height 72.
; PLAN: r0=337(x), r1=110(y), r2=117(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 110
LDI r2, 117
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
