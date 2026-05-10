; DESCRIPTION: Draws a white rectangle at (406, 110) with width 92 and height 79.
; PLAN: r0=406(x), r1=110(y), r2=92(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 110
LDI r2, 92
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
