; DESCRIPTION: Draws a white rectangle at (145, 19) with width 87 and height 108.
; PLAN: r0=145(x), r1=19(y), r2=87(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 19
LDI r2, 87
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
