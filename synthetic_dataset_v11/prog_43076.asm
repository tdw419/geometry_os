; DESCRIPTION: Composite: . Then Renders a yellow line between points (70, 93) and (15, 6). Then Draws a purple rectangle at (114, 26) with width 120 and height 22.
; PLAN: r0=70(x1), r1=93(y1), r2=15(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=26(y), r2=120(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (70, 93) and (15, 6).
; PLAN: r0=70(x1), r1=93(y1), r2=15(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 93
LDI r2, 15
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (114, 26) with width 120 and height 22.
; PLAN: r0=114(x), r1=26(y), r2=120(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 26
LDI r2, 120
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
