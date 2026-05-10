; DESCRIPTION: Draws a red rectangle at (390, 99) with width 70 and height 105.
; PLAN: r0=390(x), r1=99(y), r2=70(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 99
LDI r2, 70
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
