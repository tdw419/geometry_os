; DESCRIPTION: Composite: Places a blue dot at position (29, 227) then Renders a magenta box of size 108x100 starting at (329, 44) then Renders a purple line between points (43, 188) and (201, 248).
; PLAN: r0=29(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=44(y), r7=108(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x1), r11=188(y1), r12=201(x2), r13=248(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 329
LDI r6, 44
LDI r7, 108
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 188
LDI r12, 201
LDI r13, 248
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
