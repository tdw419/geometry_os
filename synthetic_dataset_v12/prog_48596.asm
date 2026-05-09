; DESCRIPTION: Composite: Places a orange circle of radius 33 at center (59, 138) then Sets a single green pixel at (100, 139) then Places a green line segment connecting (138, 189) to (474, 194).
; PLAN: r0=59(x), r1=138(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=139(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=138(x1), r11=189(y1), r12=474(x2), r13=194(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 138
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 139
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 138
LDI r11, 189
LDI r12, 474
LDI r13, 194
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
