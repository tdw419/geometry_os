; DESCRIPTION: Draws a white rectangle at (140, 133) with width 95 and height 115.
; PLAN: r0=140(x), r1=133(y), r2=95(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 133
LDI r2, 95
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
