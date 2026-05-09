; DESCRIPTION: Composite: . Then Renders a purple line between points (22, 30) and (57, 189). Then Draws a yellow rectangle at (154, 64) with width 54 and height 12.
; PLAN: r0=22(x1), r1=30(y1), r2=57(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=154(x), r1=64(y), r2=54(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (22, 30) and (57, 189).
; PLAN: r0=22(x1), r1=30(y1), r2=57(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 30
LDI r2, 57
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (154, 64) with width 54 and height 12.
; PLAN: r0=154(x), r1=64(y), r2=54(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 64
LDI r2, 54
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
