; DESCRIPTION: Renders a green line segment connecting (149, 142) to (179, 44).
; PLAN: r0=149(x1), r1=142(y1), r2=179(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 142
LDI r2, 179
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
