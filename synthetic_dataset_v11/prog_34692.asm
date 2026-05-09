; DESCRIPTION: Composite: . Then Places a yellow circle of radius 23 at center (193, 192). Then Places a purple line segment connecting (242, 158) to (55, 54).
; PLAN: r0=193(x), r1=192(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=242(x1), r1=158(y1), r2=55(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 23 at center (193, 192).
; PLAN: r0=193(x), r1=192(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 192
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (242, 158) to (55, 54).
; PLAN: r0=242(x1), r1=158(y1), r2=55(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 158
LDI r2, 55
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
