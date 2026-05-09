; DESCRIPTION: Renders a black line between points (508, 93) and (260, 79).
; PLAN: r0=508(x1), r1=93(y1), r2=260(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 93
LDI r2, 260
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
