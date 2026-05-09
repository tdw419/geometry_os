; DESCRIPTION: Composite: . Then Places a orange line segment connecting (238, 62) to (221, 145). Then Places a green circle of radius 27 at center (76, 207).
; PLAN: r0=238(x1), r1=62(y1), r2=221(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=76(x), r1=207(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (238, 62) to (221, 145).
; PLAN: r0=238(x1), r1=62(y1), r2=221(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 62
LDI r2, 221
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 27 at center (76, 207).
; PLAN: r0=76(x), r1=207(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 207
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
