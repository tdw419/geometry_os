; DESCRIPTION: Draws a white rectangle at (427, 145) with width 47 and height 108.
; PLAN: r0=427(x), r1=145(y), r2=47(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 145
LDI r2, 47
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
