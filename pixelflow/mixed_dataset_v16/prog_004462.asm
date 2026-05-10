; DESCRIPTION: Renders a purple line between points (149, 223) and (90, 63).
; PLAN: r0=149(x1), r1=223(y1), r2=90(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 223
LDI r2, 90
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
