; DESCRIPTION: Composite: Places a magenta dot at position (9, 27) then Renders a yellow line between points (397, 248) and (10, 227) then Draws a purple circle centered at (199, 79) with radius 46.
; PLAN: r0=9(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=248(y1), r7=10(x2), r8=227(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=79(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 248
LDI r7, 10
LDI r8, 227
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 79
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
