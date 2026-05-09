; DESCRIPTION: Renders a blue line between points (129, 205) and (347, 39).
; PLAN: r0=129(x1), r1=205(y1), r2=347(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 205
LDI r2, 347
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
