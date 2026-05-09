; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (226, 77) with width 20 and height 85. Then Draws a green line from (170, 34) to (41, 71).
; PLAN: r0=226(x), r1=77(y), r2=20(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=170(x1), r1=34(y1), r2=41(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (226, 77) with width 20 and height 85.
; PLAN: r0=226(x), r1=77(y), r2=20(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 77
LDI r2, 20
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (170, 34) to (41, 71).
; PLAN: r0=170(x1), r1=34(y1), r2=41(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 34
LDI r2, 41
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
