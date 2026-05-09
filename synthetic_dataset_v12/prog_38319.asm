; DESCRIPTION: Composite: Draws a magenta line from (1, 100) to (199, 123) then Creates a purple circular shape at (380, 123) with radius 67 then Places a blue dot at position (490, 21).
; PLAN: r0=1(x1), r1=100(y1), r2=199(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=123(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x), r11=21(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 100
LDI r2, 199
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 123
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 21
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
