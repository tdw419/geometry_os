; DESCRIPTION: Composite: Places a yellow dot at position (313, 94) then Creates a orange rectangular region at (90, 104) spanning 58 by 24 pixels then Places a yellow line segment connecting (374, 63) to (424, 169).
; PLAN: r0=313(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=104(y), r7=58(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=63(y1), r12=424(x2), r13=169(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 104
LDI r7, 58
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 63
LDI r12, 424
LDI r13, 169
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
