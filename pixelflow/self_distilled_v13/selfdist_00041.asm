; DESCRIPTION: Draws a white rectangle at (230, 179) with width 34 and height 90.
; PLAN: r0=230(x), r1=179(y), r2=34(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 179
LDI r2, 34
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
