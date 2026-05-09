; DESCRIPTION: Renders a green line between points (33, 141) and (506, 100).
; PLAN: r0=33(x1), r1=141(y1), r2=506(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 141
LDI r2, 506
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
