; DESCRIPTION: Renders a purple line between points (448, 102) and (392, 86).
; PLAN: r0=448(x1), r1=102(y1), r2=392(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 102
LDI r2, 392
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
