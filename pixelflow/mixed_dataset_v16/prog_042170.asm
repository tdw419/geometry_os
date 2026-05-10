; DESCRIPTION: Composite: Places a black dot at position (246, 251) then Creates a white circular shape at (65, 56) with radius 43 then Draws a yellow line from (62, 163) to (124, 67).
; PLAN: r0=246(x), r1=251(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=56(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=62(x1), r11=163(y1), r12=124(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 251
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 65
LDI r6, 56
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 62
LDI r11, 163
LDI r12, 124
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
