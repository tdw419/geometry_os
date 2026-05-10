; DESCRIPTION: Renders a white line segment connecting (300, 199) to (343, 144).
; PLAN: r0=300(x1), r1=199(y1), r2=343(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 199
LDI r2, 343
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
