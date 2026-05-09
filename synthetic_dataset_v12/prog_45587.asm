; DESCRIPTION: Composite: Places a blue line segment connecting (425, 28) to (128, 24) then Places a cyan circle of radius 62 at center (128, 189) then Sets a single black pixel at (408, 251).
; PLAN: r0=425(x1), r1=28(y1), r2=128(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=189(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=251(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 28
LDI r2, 128
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 189
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 251
LDI r12, 0x000000
PSET r10, r11, r12
HALT
