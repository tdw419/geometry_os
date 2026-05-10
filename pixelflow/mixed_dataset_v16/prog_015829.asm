; DESCRIPTION: Composite: Places a magenta line segment connecting (65, 129) to (378, 235) then Creates a black rectangular region at (174, 8) spanning 55 by 67 pixels then Sets a single magenta pixel at (82, 43).
; PLAN: r0=65(x1), r1=129(y1), r2=378(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=8(y), r7=55(width), r8=67(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=43(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 129
LDI r2, 378
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 8
LDI r7, 55
LDI r8, 67
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 43
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
