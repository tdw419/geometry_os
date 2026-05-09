; DESCRIPTION: Composite: Places a green line segment connecting (265, 167) to (316, 94) then Sets a single green pixel at (205, 130) then Places a cyan circle of radius 33 at center (391, 164).
; PLAN: r0=265(x1), r1=167(y1), r2=316(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=130(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=164(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 167
LDI r2, 316
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 130
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 391
LDI r11, 164
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
