; DESCRIPTION: Renders a blue line between points (409, 39) and (56, 7).
; PLAN: r0=409(x1), r1=39(y1), r2=56(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 39
LDI r2, 56
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
