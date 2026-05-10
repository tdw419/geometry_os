; DESCRIPTION: Composite: Sets a single purple pixel at (199, 251) then Places a magenta 102x106 rectangle at position (343, 6) then Places a blue line segment connecting (438, 188) to (339, 71).
; PLAN: r0=199(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=6(y), r7=102(width), r8=106(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x1), r11=188(y1), r12=339(x2), r13=71(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 343
LDI r6, 6
LDI r7, 102
LDI r8, 106
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 188
LDI r12, 339
LDI r13, 71
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
