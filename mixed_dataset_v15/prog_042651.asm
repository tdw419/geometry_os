; DESCRIPTION: Composite: Places a black dot at position (31, 83) then Places a white line segment connecting (485, 176) to (495, 77) then Places a yellow circle of radius 11 at center (284, 205).
; PLAN: r0=31(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=176(y1), r7=495(x2), r8=77(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=205(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 485
LDI r6, 176
LDI r7, 495
LDI r8, 77
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 205
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
