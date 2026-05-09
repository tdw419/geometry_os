; DESCRIPTION: Composite: . Then Renders a white line between points (163, 190) and (62, 88). Then Draws a yellow rectangle at (162, 54) with width 28 and height 66.
; PLAN: r0=163(x1), r1=190(y1), r2=62(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=54(y), r2=28(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (163, 190) and (62, 88).
; PLAN: r0=163(x1), r1=190(y1), r2=62(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 190
LDI r2, 62
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (162, 54) with width 28 and height 66.
; PLAN: r0=162(x), r1=54(y), r2=28(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 54
LDI r2, 28
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
