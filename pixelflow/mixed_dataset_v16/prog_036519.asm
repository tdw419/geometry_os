; DESCRIPTION: Composite: Places a black line segment connecting (236, 235) to (207, 248) then Places a purple circle of radius 77 at center (125, 149).
; PLAN: r0=236(x1), r1=235(y1), r2=207(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=149(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 236
LDI r1, 235
LDI r2, 207
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 149
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
