; DESCRIPTION: Composite: Places a yellow dot at position (364, 83) then Creates a green rectangular region at (163, 8) spanning 112 by 27 pixels then Draws a yellow line from (67, 105) to (480, 177).
; PLAN: r0=364(x), r1=83(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=8(y), r7=112(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x1), r11=105(y1), r12=480(x2), r13=177(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 83
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 163
LDI r6, 8
LDI r7, 112
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 105
LDI r12, 480
LDI r13, 177
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
