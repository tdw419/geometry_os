; DESCRIPTION: Renders a black line between points (273, 79) and (176, 216).
; PLAN: r0=273(x1), r1=79(y1), r2=176(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 79
LDI r2, 176
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
