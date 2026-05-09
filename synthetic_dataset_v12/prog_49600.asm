; DESCRIPTION: Renders a purple line between points (392, 61) and (8, 199).
; PLAN: r0=392(x1), r1=61(y1), r2=8(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 61
LDI r2, 8
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
