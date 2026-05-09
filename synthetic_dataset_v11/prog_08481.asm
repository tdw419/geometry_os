; DESCRIPTION: Renders a purple line between points (222, 63) and (18, 241).
; PLAN: r0=222(x1), r1=63(y1), r2=18(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 63
LDI r2, 18
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
