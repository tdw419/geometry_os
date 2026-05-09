; DESCRIPTION: Draws a white rectangle at (110, 92) with width 17 and height 99.
; PLAN: r0=110(x), r1=92(y), r2=17(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 92
LDI r2, 17
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
