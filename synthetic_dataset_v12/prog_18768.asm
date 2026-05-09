; DESCRIPTION: Composite: Renders a yellow disk with center (115, 62) and radius 45 then Places a black line segment connecting (254, 215) to (110, 235).
; PLAN: r0=115(x), r1=62(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x1), r6=215(y1), r7=110(x2), r8=235(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 62
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 215
LDI r7, 110
LDI r8, 235
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
