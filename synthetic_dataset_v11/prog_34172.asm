; DESCRIPTION: Renders a purple line between points (208, 40) and (183, 214).
; PLAN: r0=208(x1), r1=40(y1), r2=183(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 40
LDI r2, 183
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
