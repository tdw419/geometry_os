; DESCRIPTION: Composite: Draws a blue line from (1, 73) to (165, 97) then Creates a blue circular shape at (106, 47) with radius 11.
; PLAN: r0=1(x1), r1=73(y1), r2=165(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=47(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 73
LDI r2, 165
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 47
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
