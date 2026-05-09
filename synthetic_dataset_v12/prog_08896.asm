; DESCRIPTION: Renders a purple line between points (125, 171) and (398, 201).
; PLAN: r0=125(x1), r1=171(y1), r2=398(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 171
LDI r2, 398
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
