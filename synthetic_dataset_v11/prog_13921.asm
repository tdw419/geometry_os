; DESCRIPTION: Composite: . Then Places a blue circle of radius 36 at center (181, 85). Then Renders a purple line between points (55, 148) and (62, 210).
; PLAN: r0=181(x), r1=85(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=148(y1), r2=62(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 36 at center (181, 85).
; PLAN: r0=181(x), r1=85(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 85
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (55, 148) and (62, 210).
; PLAN: r0=55(x1), r1=148(y1), r2=62(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 148
LDI r2, 62
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
