; DESCRIPTION: Composite: Draws a magenta line from (70, 30) to (162, 18) then Creates a black circular shape at (477, 142) with radius 20.
; PLAN: r0=70(x1), r1=30(y1), r2=162(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=142(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 30
LDI r2, 162
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 142
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
