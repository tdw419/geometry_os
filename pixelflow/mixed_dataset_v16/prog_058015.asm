; DESCRIPTION: Composite: Sets a single purple pixel at (231, 60) then Draws a blue line from (79, 35) to (399, 37) then Creates a black circular shape at (392, 43) with radius 33.
; PLAN: r0=231(x), r1=60(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=35(y1), r7=399(x2), r8=37(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=43(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 60
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 35
LDI r7, 399
LDI r8, 37
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 43
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
