; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (107, 78) with radius 20. Then Places a black line segment connecting (120, 231) to (183, 160).
; PLAN: r0=107(x), r1=78(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x1), r1=231(y1), r2=183(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (107, 78) with radius 20.
; PLAN: r0=107(x), r1=78(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 78
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (120, 231) to (183, 160).
; PLAN: r0=120(x1), r1=231(y1), r2=183(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 231
LDI r2, 183
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
