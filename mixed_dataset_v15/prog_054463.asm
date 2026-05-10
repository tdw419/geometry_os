; DESCRIPTION: Renders a green line between points (206, 136) and (302, 233).
; PLAN: r0=206(x1), r1=136(y1), r2=302(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 136
LDI r2, 302
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
