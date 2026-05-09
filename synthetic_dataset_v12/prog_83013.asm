; DESCRIPTION: Composite: Places a black dot at position (297, 28) then Creates a white circular shape at (76, 116) with radius 17 then Renders a white line between points (92, 26) and (56, 123).
; PLAN: r0=297(x), r1=28(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=116(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x1), r11=26(y1), r12=56(x2), r13=123(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 28
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 76
LDI r6, 116
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 26
LDI r12, 56
LDI r13, 123
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
