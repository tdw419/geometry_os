; DESCRIPTION: Composite: Renders a black line between points (102, 34) and (163, 205) then Sets a single green pixel at (172, 51) then Places a white 10x17 rectangle at position (466, 46).
; PLAN: r0=102(x1), r1=34(y1), r2=163(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=466(x), r11=46(y), r12=10(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 34
LDI r2, 163
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 466
LDI r11, 46
LDI r12, 10
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
