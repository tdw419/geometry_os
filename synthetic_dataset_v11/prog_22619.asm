; DESCRIPTION: Draws a red rectangle at (140, 170) with width 14 and height 64.
; PLAN: r0=140(x), r1=170(y), r2=14(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 170
LDI r2, 14
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
