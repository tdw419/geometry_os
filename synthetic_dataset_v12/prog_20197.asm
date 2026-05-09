; DESCRIPTION: Composite: Places a purple circle of radius 61 at center (178, 175) then Places a black line segment connecting (218, 226) to (402, 183) then Places a blue dot at position (373, 107).
; PLAN: r0=178(x), r1=175(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x1), r6=226(y1), r7=402(x2), r8=183(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=107(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 175
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 226
LDI r7, 402
LDI r8, 183
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 107
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
