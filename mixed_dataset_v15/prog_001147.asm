; DESCRIPTION: Composite: Sets a single purple pixel at (397, 251) then Draws a purple circle centered at (95, 110) with radius 68 then Draws a yellow line from (157, 99) to (25, 68).
; PLAN: r0=397(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=110(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x1), r11=99(y1), r12=25(x2), r13=68(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 110
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 99
LDI r12, 25
LDI r13, 68
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
