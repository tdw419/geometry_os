; DESCRIPTION: Renders a purple line between points (138, 249) and (208, 158).
; PLAN: r0=138(x1), r1=249(y1), r2=208(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 249
LDI r2, 208
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
