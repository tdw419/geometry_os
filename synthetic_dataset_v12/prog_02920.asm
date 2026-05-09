; DESCRIPTION: Renders a green line between points (361, 181) and (142, 54).
; PLAN: r0=361(x1), r1=181(y1), r2=142(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 181
LDI r2, 142
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
