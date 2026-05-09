; DESCRIPTION: Composite: Creates a magenta circular shape at (246, 100) with radius 76 then Places a purple dot at position (427, 145) then Draws a red line from (105, 110) to (480, 31).
; PLAN: r0=246(x), r1=100(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=145(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=105(x1), r11=110(y1), r12=480(x2), r13=31(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 100
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 145
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 105
LDI r11, 110
LDI r12, 480
LDI r13, 31
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
