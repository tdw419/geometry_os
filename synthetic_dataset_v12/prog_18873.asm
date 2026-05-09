; DESCRIPTION: Renders a blue line between points (129, 227) and (401, 244).
; PLAN: r0=129(x1), r1=227(y1), r2=401(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 227
LDI r2, 401
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
