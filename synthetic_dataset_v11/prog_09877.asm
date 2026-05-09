; DESCRIPTION: Renders a purple line between points (198, 161) and (199, 220).
; PLAN: r0=198(x1), r1=161(y1), r2=199(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 161
LDI r2, 199
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
