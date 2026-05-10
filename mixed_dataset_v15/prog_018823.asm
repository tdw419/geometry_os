; DESCRIPTION: Renders a magenta line between points (199, 220) and (331, 119).
; PLAN: r0=199(x1), r1=220(y1), r2=331(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 220
LDI r2, 331
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
