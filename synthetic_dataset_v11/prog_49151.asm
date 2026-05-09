; DESCRIPTION: Composite: . Then Places a blue line segment connecting (23, 51) to (205, 132). Then Places a white circle of radius 15 at center (98, 54).
; PLAN: r0=23(x1), r1=51(y1), r2=205(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=98(x), r1=54(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (23, 51) to (205, 132).
; PLAN: r0=23(x1), r1=51(y1), r2=205(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 51
LDI r2, 205
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 15 at center (98, 54).
; PLAN: r0=98(x), r1=54(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 54
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
