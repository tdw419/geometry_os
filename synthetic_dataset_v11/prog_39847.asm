; DESCRIPTION: Draws a red rectangle at (176, 97) with width 31 and height 73.
; PLAN: r0=176(x), r1=97(y), r2=31(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 97
LDI r2, 31
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
