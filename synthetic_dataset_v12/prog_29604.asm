; DESCRIPTION: Composite: Places a red line segment connecting (417, 25) to (288, 186) then Draws a red circle centered at (245, 235) with radius 21.
; PLAN: r0=417(x1), r1=25(y1), r2=288(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=235(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 25
LDI r2, 288
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 235
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
