; DESCRIPTION: Draws a red rectangle at (112, 14) with width 83 and height 94.
; PLAN: r0=112(x), r1=14(y), r2=83(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 14
LDI r2, 83
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
