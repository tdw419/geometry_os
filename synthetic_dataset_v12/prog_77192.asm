; DESCRIPTION: Renders a green line between points (345, 199) and (29, 9).
; PLAN: r0=345(x1), r1=199(y1), r2=29(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 199
LDI r2, 29
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
