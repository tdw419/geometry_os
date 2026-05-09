; DESCRIPTION: Draws a white rectangle at (195, 133) with width 115 and height 105.
; PLAN: r0=195(x), r1=133(y), r2=115(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 133
LDI r2, 115
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
