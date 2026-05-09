; DESCRIPTION: Composite: Sets a single magenta pixel at (58, 208) then Creates a green rectangular region at (438, 151) spanning 53 by 96 pixels then Renders a green line between points (417, 216) and (315, 247).
; PLAN: r0=58(x), r1=208(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=151(y), r7=53(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x1), r11=216(y1), r12=315(x2), r13=247(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 208
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 151
LDI r7, 53
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 216
LDI r12, 315
LDI r13, 247
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
