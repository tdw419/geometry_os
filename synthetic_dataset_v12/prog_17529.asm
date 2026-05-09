; DESCRIPTION: Renders a purple line between points (107, 150) and (63, 87).
; PLAN: r0=107(x1), r1=150(y1), r2=63(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 150
LDI r2, 63
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
