; DESCRIPTION: Composite: . Then Places a yellow circle of radius 22 at center (40, 40). Then Places a orange line segment connecting (48, 36) to (225, 207).
; PLAN: r0=40(x), r1=40(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x1), r1=36(y1), r2=225(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 22 at center (40, 40).
; PLAN: r0=40(x), r1=40(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 40
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (48, 36) to (225, 207).
; PLAN: r0=48(x1), r1=36(y1), r2=225(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 36
LDI r2, 225
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
