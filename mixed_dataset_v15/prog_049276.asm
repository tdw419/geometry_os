; DESCRIPTION: Draws a red rectangle at (283, 141) with width 106 and height 26.
; PLAN: r0=283(x), r1=141(y), r2=106(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 141
LDI r2, 106
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
