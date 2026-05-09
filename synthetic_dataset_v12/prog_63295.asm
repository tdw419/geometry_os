; DESCRIPTION: Renders a blue line between points (468, 205) and (227, 221).
; PLAN: r0=468(x1), r1=205(y1), r2=227(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 205
LDI r2, 227
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
