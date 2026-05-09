; DESCRIPTION: Composite: . Then Places a green line segment connecting (244, 224) to (206, 210). Then Creates a purple circular shape at (185, 110) with radius 55.
; PLAN: r0=244(x1), r1=224(y1), r2=206(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=185(x), r1=110(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (244, 224) to (206, 210).
; PLAN: r0=244(x1), r1=224(y1), r2=206(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 224
LDI r2, 206
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (185, 110) with radius 55.
; PLAN: r0=185(x), r1=110(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 110
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
