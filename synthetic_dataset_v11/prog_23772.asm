; DESCRIPTION: Renders a black line between points (106, 26) and (189, 125).
; PLAN: r0=106(x1), r1=26(y1), r2=189(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 26
LDI r2, 189
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
