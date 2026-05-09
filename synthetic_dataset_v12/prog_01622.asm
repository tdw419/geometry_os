; DESCRIPTION: Renders a blue line between points (381, 152) and (331, 158).
; PLAN: r0=381(x1), r1=152(y1), r2=331(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 152
LDI r2, 331
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
