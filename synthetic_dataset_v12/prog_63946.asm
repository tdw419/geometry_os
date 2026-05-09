; DESCRIPTION: Composite: Sets a single magenta pixel at (248, 218) then Renders a green line between points (61, 253) and (417, 167) then Creates a blue circular shape at (73, 90) with radius 67.
; PLAN: r0=248(x), r1=218(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=253(y1), r7=417(x2), r8=167(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=90(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 218
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 61
LDI r6, 253
LDI r7, 417
LDI r8, 167
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 90
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
