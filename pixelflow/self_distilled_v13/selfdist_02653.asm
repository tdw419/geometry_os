; DESCRIPTION: Renders a green line segment connecting (181, 39) to (235, 78).
; PLAN: r0=181(x1), r1=39(y1), r2=235(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 39
LDI r2, 235
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
