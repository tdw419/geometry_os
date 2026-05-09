; DESCRIPTION: Composite: Sets a single blue pixel at (8, 167) then Creates a black rectangular region at (307, 25) spanning 55 by 88 pixels then Renders a purple line between points (63, 27) and (71, 242).
; PLAN: r0=8(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=25(y), r7=55(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x1), r11=27(y1), r12=71(x2), r13=242(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 25
LDI r7, 55
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 27
LDI r12, 71
LDI r13, 242
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
