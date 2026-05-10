; DESCRIPTION: Renders a green line between points (380, 227) and (132, 226).
; PLAN: r0=380(x1), r1=227(y1), r2=132(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 227
LDI r2, 132
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
