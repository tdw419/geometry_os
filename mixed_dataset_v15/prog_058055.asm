; DESCRIPTION: Renders a yellow line between points (407, 135) and (33, 119).
; PLAN: r0=407(x1), r1=135(y1), r2=33(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 135
LDI r2, 33
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
