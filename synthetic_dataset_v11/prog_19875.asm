; DESCRIPTION: Composite: . Then Places a purple line segment connecting (42, 80) to (220, 49). Then Places a black circle of radius 55 at center (62, 101).
; PLAN: r0=42(x1), r1=80(y1), r2=220(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=101(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (42, 80) to (220, 49).
; PLAN: r0=42(x1), r1=80(y1), r2=220(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 80
LDI r2, 220
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 55 at center (62, 101).
; PLAN: r0=62(x), r1=101(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 101
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
