; DESCRIPTION: Composite: Places a cyan circle of radius 29 at center (191, 140) then Places a green line segment connecting (53, 3) to (340, 96) then Sets a single yellow pixel at (164, 39).
; PLAN: r0=191(x), r1=140(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=3(y1), r7=340(x2), r8=96(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=39(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 140
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 3
LDI r7, 340
LDI r8, 96
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 39
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
