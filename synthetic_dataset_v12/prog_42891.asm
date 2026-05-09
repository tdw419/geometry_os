; DESCRIPTION: Composite: Draws a orange line from (217, 85) to (65, 75) then Creates a purple circular shape at (108, 166) with radius 56.
; PLAN: r0=217(x1), r1=85(y1), r2=65(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=166(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 85
LDI r2, 65
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 166
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
