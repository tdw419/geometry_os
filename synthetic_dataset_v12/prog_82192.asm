; DESCRIPTION: Renders a purple line between points (372, 194) and (235, 0).
; PLAN: r0=372(x1), r1=194(y1), r2=235(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 194
LDI r2, 235
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
