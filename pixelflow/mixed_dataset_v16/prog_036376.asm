; DESCRIPTION: Composite: Places a green circle of radius 69 at center (183, 167) then Places a orange line segment connecting (214, 143) to (495, 204) then Sets a single orange pixel at (456, 241).
; PLAN: r0=183(x), r1=167(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x1), r6=143(y1), r7=495(x2), r8=204(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=241(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 167
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 143
LDI r7, 495
LDI r8, 204
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 241
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
