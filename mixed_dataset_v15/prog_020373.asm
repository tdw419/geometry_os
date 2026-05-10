; DESCRIPTION: Renders a purple line between points (198, 117) and (503, 250).
; PLAN: r0=198(x1), r1=117(y1), r2=503(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 117
LDI r2, 503
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
