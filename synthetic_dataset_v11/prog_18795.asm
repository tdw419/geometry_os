; DESCRIPTION: Composite: . Then Draws a black circle centered at (56, 123) with radius 55. Then Renders a purple line between points (3, 158) and (206, 196).
; PLAN: r0=56(x), r1=123(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x1), r1=158(y1), r2=206(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (56, 123) with radius 55.
; PLAN: r0=56(x), r1=123(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 123
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (3, 158) and (206, 196).
; PLAN: r0=3(x1), r1=158(y1), r2=206(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 158
LDI r2, 206
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
