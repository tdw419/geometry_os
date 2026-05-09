; DESCRIPTION: Composite: . Then Places a white line segment connecting (108, 99) to (170, 205). Then Places a white circle of radius 49 at center (158, 51).
; PLAN: r0=108(x1), r1=99(y1), r2=170(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=158(x), r1=51(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (108, 99) to (170, 205).
; PLAN: r0=108(x1), r1=99(y1), r2=170(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 99
LDI r2, 170
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 49 at center (158, 51).
; PLAN: r0=158(x), r1=51(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 51
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
