; DESCRIPTION: Renders a purple line between points (123, 127) and (152, 227).
; PLAN: r0=123(x1), r1=127(y1), r2=152(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 127
LDI r2, 152
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
