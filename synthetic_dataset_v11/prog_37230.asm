; DESCRIPTION: Composite: . Then Places a cyan circle of radius 72 at center (109, 175). Then Places a white line segment connecting (52, 9) to (133, 106).
; PLAN: r0=109(x), r1=175(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x1), r1=9(y1), r2=133(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 72 at center (109, 175).
; PLAN: r0=109(x), r1=175(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 175
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (52, 9) to (133, 106).
; PLAN: r0=52(x1), r1=9(y1), r2=133(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 9
LDI r2, 133
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
