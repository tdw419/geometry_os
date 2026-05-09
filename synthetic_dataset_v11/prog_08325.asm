; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (88, 134) with radius 60. Then Places a black line segment connecting (23, 125) to (87, 237).
; PLAN: r0=88(x), r1=134(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x1), r1=125(y1), r2=87(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (88, 134) with radius 60.
; PLAN: r0=88(x), r1=134(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 134
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (23, 125) to (87, 237).
; PLAN: r0=23(x1), r1=125(y1), r2=87(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 125
LDI r2, 87
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
