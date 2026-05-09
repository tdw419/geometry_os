; DESCRIPTION: Renders a purple line between points (211, 253) and (353, 210).
; PLAN: r0=211(x1), r1=253(y1), r2=353(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 253
LDI r2, 353
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
