; DESCRIPTION: Renders a yellow line segment connecting (378, 130) to (235, 194).
; PLAN: r0=378(x1), r1=130(y1), r2=235(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 130
LDI r2, 235
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
