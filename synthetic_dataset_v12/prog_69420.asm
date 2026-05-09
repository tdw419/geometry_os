; DESCRIPTION: Composite: Draws a green circle centered at (251, 61) with radius 48 then Renders a blue line between points (143, 29) and (158, 235).
; PLAN: r0=251(x), r1=61(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x1), r6=29(y1), r7=158(x2), r8=235(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 61
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 29
LDI r7, 158
LDI r8, 235
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
