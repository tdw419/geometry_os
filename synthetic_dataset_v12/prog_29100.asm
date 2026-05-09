; DESCRIPTION: Composite: Sets a single cyan pixel at (190, 160) then Places a white line segment connecting (76, 227) to (497, 130) then Renders a green disk with center (114, 56) and radius 56.
; PLAN: r0=190(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=76(x1), r6=227(y1), r7=497(x2), r8=130(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=56(y), r12=56(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 76
LDI r6, 227
LDI r7, 497
LDI r8, 130
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 56
LDI r12, 56
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
