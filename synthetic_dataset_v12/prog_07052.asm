; DESCRIPTION: Renders a white line between points (106, 181) and (125, 66).
; PLAN: r0=106(x1), r1=181(y1), r2=125(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 181
LDI r2, 125
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
