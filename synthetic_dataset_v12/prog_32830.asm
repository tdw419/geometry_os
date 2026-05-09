; DESCRIPTION: Composite: Places a black dot at position (438, 15) then Creates a purple rectangular region at (78, 56) spanning 120 by 33 pixels then Renders a yellow line between points (331, 48) and (382, 61).
; PLAN: r0=438(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=56(y), r7=120(width), r8=33(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=48(y1), r12=382(x2), r13=61(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 15
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 78
LDI r6, 56
LDI r7, 120
LDI r8, 33
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 48
LDI r12, 382
LDI r13, 61
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
