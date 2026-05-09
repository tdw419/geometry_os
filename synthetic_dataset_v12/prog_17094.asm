; DESCRIPTION: Composite: Places a cyan circle of radius 32 at center (107, 169) then Creates a white rectangular region at (192, 227) spanning 27 by 29 pixels then Draws a purple line from (506, 44) to (399, 144).
; PLAN: r0=107(x), r1=169(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=227(y), r7=27(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x1), r11=44(y1), r12=399(x2), r13=144(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 169
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 227
LDI r7, 27
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 44
LDI r12, 399
LDI r13, 144
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
