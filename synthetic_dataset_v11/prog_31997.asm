; DESCRIPTION: Renders a blue line between points (235, 93) and (37, 125).
; PLAN: r0=235(x1), r1=93(y1), r2=37(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 93
LDI r2, 37
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
