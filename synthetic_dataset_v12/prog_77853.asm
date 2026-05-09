; DESCRIPTION: Composite: Places a white line segment connecting (87, 238) to (23, 20) then Renders a black disk with center (409, 181) and radius 16.
; PLAN: r0=87(x1), r1=238(y1), r2=23(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=181(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 238
LDI r2, 23
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 181
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
