; DESCRIPTION: Renders a blue line between points (161, 58) and (293, 196).
; PLAN: r0=161(x1), r1=58(y1), r2=293(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 58
LDI r2, 293
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
