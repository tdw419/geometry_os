; DESCRIPTION: Composite: . Then Renders a yellow line between points (40, 148) and (248, 90). Then Draws a yellow rectangle at (95, 113) with width 100 and height 118.
; PLAN: r0=40(x1), r1=148(y1), r2=248(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=113(y), r2=100(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (40, 148) and (248, 90).
; PLAN: r0=40(x1), r1=148(y1), r2=248(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 148
LDI r2, 248
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (95, 113) with width 100 and height 118.
; PLAN: r0=95(x), r1=113(y), r2=100(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 113
LDI r2, 100
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
