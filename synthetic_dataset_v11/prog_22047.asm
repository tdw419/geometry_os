; DESCRIPTION: Renders a blue line between points (23, 79) and (235, 122).
; PLAN: r0=23(x1), r1=79(y1), r2=235(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 79
LDI r2, 235
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
