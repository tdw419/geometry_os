; DESCRIPTION: Renders a green line between points (249, 107) and (461, 79).
; PLAN: r0=249(x1), r1=107(y1), r2=461(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 107
LDI r2, 461
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
