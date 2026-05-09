; DESCRIPTION: Composite: . Then Renders a blue line between points (150, 170) and (189, 45). Then Creates a purple circular shape at (97, 142) with radius 66.
; PLAN: r0=150(x1), r1=170(y1), r2=189(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=142(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (150, 170) and (189, 45).
; PLAN: r0=150(x1), r1=170(y1), r2=189(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 170
LDI r2, 189
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (97, 142) with radius 66.
; PLAN: r0=97(x), r1=142(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 142
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
