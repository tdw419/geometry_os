; DESCRIPTION: Draws a red rectangle at (52, 179) with width 105 and height 34.
; PLAN: r0=52(x), r1=179(y), r2=105(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 179
LDI r2, 105
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
