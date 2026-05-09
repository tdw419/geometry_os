; DESCRIPTION: Composite: Draws a magenta line from (301, 65) to (25, 235) then Creates a purple circular shape at (324, 77) with radius 43.
; PLAN: r0=301(x1), r1=65(y1), r2=25(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=77(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 65
LDI r2, 25
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 77
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
