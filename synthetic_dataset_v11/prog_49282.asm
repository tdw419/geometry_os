; DESCRIPTION: Composite: . Then Draws a blue circle centered at (90, 176) with radius 74. Then Places a yellow line segment connecting (118, 129) to (194, 141).
; PLAN: r0=90(x), r1=176(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=118(x1), r1=129(y1), r2=194(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (90, 176) with radius 74.
; PLAN: r0=90(x), r1=176(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 176
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (118, 129) to (194, 141).
; PLAN: r0=118(x1), r1=129(y1), r2=194(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 129
LDI r2, 194
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
