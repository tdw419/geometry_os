; DESCRIPTION: Renders a white line between points (235, 105) and (4, 101).
; PLAN: r0=235(x1), r1=105(y1), r2=4(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 105
LDI r2, 4
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
