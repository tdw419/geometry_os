; DESCRIPTION: Composite: Places a green circle of radius 46 at center (242, 138) then Sets a single orange pixel at (52, 72) then Places a green line segment connecting (129, 218) to (295, 218).
; PLAN: r0=242(x), r1=138(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=218(y1), r12=295(x2), r13=218(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 138
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 129
LDI r11, 218
LDI r12, 295
LDI r13, 218
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
