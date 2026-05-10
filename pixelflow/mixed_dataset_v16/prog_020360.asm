; DESCRIPTION: Composite: Sets a single magenta pixel at (157, 80) then Places a orange line segment connecting (6, 230) to (203, 235) then Places a red circle of radius 31 at center (254, 194).
; PLAN: r0=157(x), r1=80(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=6(x1), r6=230(y1), r7=203(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=194(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 80
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 6
LDI r6, 230
LDI r7, 203
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 194
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
