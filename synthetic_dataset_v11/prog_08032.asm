; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (141, 86) with radius 40. Then Places a purple line segment connecting (243, 3) to (105, 186).
; PLAN: r0=141(x), r1=86(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=243(x1), r1=3(y1), r2=105(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (141, 86) with radius 40.
; PLAN: r0=141(x), r1=86(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 86
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (243, 3) to (105, 186).
; PLAN: r0=243(x1), r1=3(y1), r2=105(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 3
LDI r2, 105
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
