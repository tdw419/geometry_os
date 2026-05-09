; DESCRIPTION: Renders a purple line between points (178, 81) and (46, 45).
; PLAN: r0=178(x1), r1=81(y1), r2=46(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 81
LDI r2, 46
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
