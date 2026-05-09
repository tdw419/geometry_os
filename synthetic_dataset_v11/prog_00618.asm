; DESCRIPTION: Composite: . Then Draws a yellow line from (70, 98) to (140, 162). Then Draws a purple rectangle at (41, 6) with width 88 and height 85.
; PLAN: r0=70(x1), r1=98(y1), r2=140(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=6(y), r2=88(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (70, 98) to (140, 162).
; PLAN: r0=70(x1), r1=98(y1), r2=140(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 98
LDI r2, 140
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (41, 6) with width 88 and height 85.
; PLAN: r0=41(x), r1=6(y), r2=88(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 6
LDI r2, 88
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
