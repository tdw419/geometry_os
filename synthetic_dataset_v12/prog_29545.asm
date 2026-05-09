; DESCRIPTION: Composite: Places a green line segment connecting (66, 40) to (299, 248) then Creates a green circular shape at (402, 52) with radius 52 then Places a black dot at position (264, 120).
; PLAN: r0=66(x1), r1=40(y1), r2=299(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=52(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=120(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 40
LDI r2, 299
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 52
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 120
LDI r12, 0x000000
PSET r10, r11, r12
HALT
