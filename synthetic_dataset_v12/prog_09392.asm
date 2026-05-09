; DESCRIPTION: Composite: Sets a single magenta pixel at (420, 235) then Places a green line segment connecting (42, 175) to (371, 60) then Creates a blue circular shape at (212, 163) with radius 60.
; PLAN: r0=420(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=175(y1), r7=371(x2), r8=60(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=163(y), r12=60(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 420
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 175
LDI r7, 371
LDI r8, 60
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 163
LDI r12, 60
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
