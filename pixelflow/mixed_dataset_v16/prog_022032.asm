; DESCRIPTION: Composite: Sets a single orange pixel at (2, 5) then Draws a blue line from (243, 145) to (156, 69) then Creates a black circular shape at (291, 180) with radius 25.
; PLAN: r0=2(x), r1=5(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=243(x1), r6=145(y1), r7=156(x2), r8=69(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=291(x), r11=180(y), r12=25(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 5
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 243
LDI r6, 145
LDI r7, 156
LDI r8, 69
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 180
LDI r12, 25
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
