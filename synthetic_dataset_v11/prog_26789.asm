; DESCRIPTION: Renders a black line between points (13, 93) and (235, 122).
; PLAN: r0=13(x1), r1=93(y1), r2=235(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 93
LDI r2, 235
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
