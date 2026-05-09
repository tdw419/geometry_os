; DESCRIPTION: Composite: Places a green dot at position (476, 182) then Renders a purple line between points (33, 189) and (197, 225) then Creates a cyan rectangular region at (453, 22) spanning 49 by 103 pixels.
; PLAN: r0=476(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=33(x1), r6=189(y1), r7=197(x2), r8=225(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=453(x), r11=22(y), r12=49(width), r13=103(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 33
LDI r6, 189
LDI r7, 197
LDI r8, 225
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 22
LDI r12, 49
LDI r13, 103
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
