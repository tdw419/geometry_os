; DESCRIPTION: Composite: Sets a single green pixel at (113, 114) then Places a yellow line segment connecting (42, 91) to (325, 17) then Creates a magenta rectangular region at (247, 198) spanning 77 by 40 pixels.
; PLAN: r0=113(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=91(y1), r7=325(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=198(y), r12=77(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 42
LDI r6, 91
LDI r7, 325
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 198
LDI r12, 77
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
