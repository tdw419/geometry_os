; DESCRIPTION: Composite: Places a red dot at position (43, 11) then Renders a yellow disk with center (241, 218) and radius 14 then Places a black line segment connecting (504, 186) to (339, 229).
; PLAN: r0=43(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=218(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=186(y1), r12=339(x2), r13=229(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 241
LDI r6, 218
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 186
LDI r12, 339
LDI r13, 229
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
