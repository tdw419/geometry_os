; DESCRIPTION: Renders a green line between points (80, 183) and (58, 233).
; PLAN: r0=80(x1), r1=183(y1), r2=58(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 183
LDI r2, 58
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
