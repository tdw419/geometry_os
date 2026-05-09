; DESCRIPTION: Composite: . Then Places a blue line segment connecting (12, 70) to (26, 209). Then Creates a purple circular shape at (115, 54) with radius 46.
; PLAN: r0=12(x1), r1=70(y1), r2=26(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=54(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (12, 70) to (26, 209).
; PLAN: r0=12(x1), r1=70(y1), r2=26(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 70
LDI r2, 26
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (115, 54) with radius 46.
; PLAN: r0=115(x), r1=54(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 54
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
