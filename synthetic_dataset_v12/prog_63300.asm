; DESCRIPTION: Composite: Places a magenta dot at position (508, 242) then Places a purple line segment connecting (283, 63) to (488, 231) then Draws a black circle centered at (408, 109) with radius 55.
; PLAN: r0=508(x), r1=242(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=63(y1), r7=488(x2), r8=231(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=109(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 242
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 63
LDI r7, 488
LDI r8, 231
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 109
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
