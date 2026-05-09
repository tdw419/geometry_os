; DESCRIPTION: Renders a black line between points (170, 163) and (235, 138).
; PLAN: r0=170(x1), r1=163(y1), r2=235(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 163
LDI r2, 235
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
