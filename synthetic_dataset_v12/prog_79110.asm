; DESCRIPTION: Renders a purple line between points (125, 173) and (80, 79).
; PLAN: r0=125(x1), r1=173(y1), r2=80(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 173
LDI r2, 80
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
