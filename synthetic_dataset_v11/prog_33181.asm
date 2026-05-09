; DESCRIPTION: Renders a green line between points (193, 223) and (139, 136).
; PLAN: r0=193(x1), r1=223(y1), r2=139(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 223
LDI r2, 139
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
