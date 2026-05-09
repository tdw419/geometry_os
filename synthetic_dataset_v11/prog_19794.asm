; DESCRIPTION: Composite: . Then Draws a red rectangle at (99, 158) with width 114 and height 26. Then Draws a purple line from (30, 18) to (180, 137).
; PLAN: r0=99(x), r1=158(y), r2=114(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=30(x1), r1=18(y1), r2=180(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (99, 158) with width 114 and height 26.
; PLAN: r0=99(x), r1=158(y), r2=114(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 158
LDI r2, 114
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (30, 18) to (180, 137).
; PLAN: r0=30(x1), r1=18(y1), r2=180(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 18
LDI r2, 180
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
