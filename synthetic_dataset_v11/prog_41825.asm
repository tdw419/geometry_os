; DESCRIPTION: Renders a blue line between points (237, 142) and (192, 210).
; PLAN: r0=237(x1), r1=142(y1), r2=192(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 142
LDI r2, 192
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
