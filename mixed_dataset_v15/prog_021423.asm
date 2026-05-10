; DESCRIPTION: Composite: Places a magenta line segment connecting (476, 148) to (143, 73) then Places a black dot at position (165, 235) then Draws a black circle centered at (174, 126) with radius 79.
; PLAN: r0=476(x1), r1=148(y1), r2=143(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=235(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=126(y), r12=79(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 476
LDI r1, 148
LDI r2, 143
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 235
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 174
LDI r11, 126
LDI r12, 79
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
