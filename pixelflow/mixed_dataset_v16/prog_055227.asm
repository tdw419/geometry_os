; DESCRIPTION: Composite: Places a green circle of radius 78 at center (233, 123) then Sets a single cyan pixel at (407, 205) then Places a white line segment connecting (343, 207) to (403, 241).
; PLAN: r0=233(x), r1=123(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=205(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=343(x1), r11=207(y1), r12=403(x2), r13=241(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 123
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 205
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 343
LDI r11, 207
LDI r12, 403
LDI r13, 241
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
