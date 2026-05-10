; DESCRIPTION: Composite: Places a orange line segment connecting (289, 139) to (153, 98) then Sets a single blue pixel at (140, 13) then Places a magenta 42x97 rectangle at position (336, 150).
; PLAN: r0=289(x1), r1=139(y1), r2=153(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=13(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=150(y), r12=42(width), r13=97(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 139
LDI r2, 153
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 13
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 336
LDI r11, 150
LDI r12, 42
LDI r13, 97
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
