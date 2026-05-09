; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (24, 123) with width 117 and height 115. Then Draws a purple line from (120, 191) to (88, 89).
; PLAN: r0=24(x), r1=123(y), r2=117(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x1), r1=191(y1), r2=88(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (24, 123) with width 117 and height 115.
; PLAN: r0=24(x), r1=123(y), r2=117(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 123
LDI r2, 117
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (120, 191) to (88, 89).
; PLAN: r0=120(x1), r1=191(y1), r2=88(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 191
LDI r2, 88
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
