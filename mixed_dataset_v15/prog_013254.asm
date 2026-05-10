; DESCRIPTION: Composite: Sets a single blue pixel at (354, 207) then Draws a blue line from (413, 31) to (393, 194) then Creates a green circular shape at (183, 104) with radius 72.
; PLAN: r0=354(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=31(y1), r7=393(x2), r8=194(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=104(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 354
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 31
LDI r7, 393
LDI r8, 194
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 104
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
