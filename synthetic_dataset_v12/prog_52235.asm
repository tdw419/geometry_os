; DESCRIPTION: Composite: Places a purple circle of radius 39 at center (40, 103) then Places a black line segment connecting (329, 142) to (473, 11) then Sets a single orange pixel at (77, 175).
; PLAN: r0=40(x), r1=103(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=142(y1), r7=473(x2), r8=11(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=175(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 103
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 142
LDI r7, 473
LDI r8, 11
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 175
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
