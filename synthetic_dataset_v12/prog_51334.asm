; DESCRIPTION: Composite: Places a black circle of radius 20 at center (478, 79) then Places a yellow line segment connecting (470, 242) to (333, 20) then Sets a single orange pixel at (331, 69).
; PLAN: r0=478(x), r1=79(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x1), r6=242(y1), r7=333(x2), r8=20(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=69(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 478
LDI r1, 79
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 242
LDI r7, 333
LDI r8, 20
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 69
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
