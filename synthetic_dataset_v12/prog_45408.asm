; DESCRIPTION: Renders a blue line between points (131, 22) and (189, 187).
; PLAN: r0=131(x1), r1=22(y1), r2=189(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 22
LDI r2, 189
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
