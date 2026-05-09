; DESCRIPTION: Renders a black line between points (106, 250) and (73, 63).
; PLAN: r0=106(x1), r1=250(y1), r2=73(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 250
LDI r2, 73
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
