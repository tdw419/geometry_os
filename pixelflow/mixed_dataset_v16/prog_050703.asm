; DESCRIPTION: Composite: Places a white circle of radius 28 at center (437, 228) then Sets a single orange pixel at (351, 123) then Places a red line segment connecting (125, 56) to (435, 192).
; PLAN: r0=437(x), r1=228(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=123(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=125(x1), r11=56(y1), r12=435(x2), r13=192(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 228
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 123
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 125
LDI r11, 56
LDI r12, 435
LDI r13, 192
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
