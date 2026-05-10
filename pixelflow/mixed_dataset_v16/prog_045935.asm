; DESCRIPTION: Composite: Sets a single white pixel at (132, 102) then Creates a green rectangular region at (231, 173) spanning 51 by 17 pixels then Places a yellow line segment connecting (440, 252) to (43, 96).
; PLAN: r0=132(x), r1=102(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=173(y), r7=51(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x1), r11=252(y1), r12=43(x2), r13=96(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 102
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 173
LDI r7, 51
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 252
LDI r12, 43
LDI r13, 96
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
