; DESCRIPTION: Draws a white rectangle at (179, 65) with width 51 and height 34.
; PLAN: r0=179(x), r1=65(y), r2=51(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 65
LDI r2, 51
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
