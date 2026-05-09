; DESCRIPTION: Renders a blue line between points (52, 214) and (39, 80).
; PLAN: r0=52(x1), r1=214(y1), r2=39(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 214
LDI r2, 39
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
