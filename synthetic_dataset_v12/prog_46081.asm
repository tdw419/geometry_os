; DESCRIPTION: Composite: Sets a single magenta pixel at (177, 222) then Renders a black line between points (385, 97) and (361, 105) then Draws a cyan circle centered at (356, 102) with radius 38.
; PLAN: r0=177(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=97(y1), r7=361(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=102(y), r12=38(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 177
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 97
LDI r7, 361
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 102
LDI r12, 38
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
