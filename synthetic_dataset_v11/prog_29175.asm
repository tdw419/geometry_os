; DESCRIPTION: Renders a green line between points (91, 20) and (142, 233).
; PLAN: r0=91(x1), r1=20(y1), r2=142(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 20
LDI r2, 142
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
