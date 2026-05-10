; DESCRIPTION: Composite: Places a black line segment connecting (235, 147) to (370, 122) then Renders a purple disk with center (105, 150) and radius 26.
; PLAN: r0=235(x1), r1=147(y1), r2=370(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=150(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 147
LDI r2, 370
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 150
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
