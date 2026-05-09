; DESCRIPTION: Draws a red rectangle at (417, 122) with width 54 and height 37.
; PLAN: r0=417(x), r1=122(y), r2=54(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 122
LDI r2, 54
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
