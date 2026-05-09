; DESCRIPTION: Draws a white rectangle at (321, 133) with width 110 and height 70.
; PLAN: r0=321(x), r1=133(y), r2=110(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 133
LDI r2, 110
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
