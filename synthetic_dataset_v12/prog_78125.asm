; DESCRIPTION: Renders a blue line between points (56, 249) and (388, 46).
; PLAN: r0=56(x1), r1=249(y1), r2=388(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 249
LDI r2, 388
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
