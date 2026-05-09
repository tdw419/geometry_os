; DESCRIPTION: Composite: Sets a single black pixel at (173, 235) then Renders a black line between points (141, 149) and (44, 113) then Creates a green circular shape at (371, 77) with radius 13.
; PLAN: r0=173(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=149(y1), r7=44(x2), r8=113(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=77(y), r12=13(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 141
LDI r6, 149
LDI r7, 44
LDI r8, 113
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 77
LDI r12, 13
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
