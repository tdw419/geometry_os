; DESCRIPTION: Draws a red rectangle at (235, 54) with width 43 and height 97.
; PLAN: r0=235(x), r1=54(y), r2=43(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 54
LDI r2, 43
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
