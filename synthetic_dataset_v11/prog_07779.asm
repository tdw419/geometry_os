; DESCRIPTION: Renders a purple line between points (46, 11) and (254, 115).
; PLAN: r0=46(x1), r1=11(y1), r2=254(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 11
LDI r2, 254
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
