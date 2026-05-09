; DESCRIPTION: Composite: Sets a single red pixel at (112, 147) then Creates a orange rectangular region at (136, 57) spanning 113 by 87 pixels then Places a purple circle of radius 51 at center (196, 105).
; PLAN: r0=112(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=57(y), r7=113(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=105(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 136
LDI r6, 57
LDI r7, 113
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 105
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
