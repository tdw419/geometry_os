; DESCRIPTION: Renders a black line between points (106, 142) and (13, 132).
; PLAN: r0=106(x1), r1=142(y1), r2=13(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 142
LDI r2, 13
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
