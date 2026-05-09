; DESCRIPTION: Composite: Places a black line segment connecting (326, 130) to (433, 201) then Renders a white disk with center (148, 83) and radius 64.
; PLAN: r0=326(x1), r1=130(y1), r2=433(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=83(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 130
LDI r2, 433
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 83
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
