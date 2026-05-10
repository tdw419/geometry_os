; DESCRIPTION: Composite: Renders a purple line between points (382, 23) and (150, 0) then Draws a yellow rectangle at (158, 158) with width 119 and height 12.
; PLAN: r0=382(x1), r1=23(y1), r2=150(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=158(y), r7=119(width), r8=12(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 23
LDI r2, 150
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 158
LDI r7, 119
LDI r8, 12
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
