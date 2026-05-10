; DESCRIPTION: Renders a green line between points (132, 89) and (382, 157).
; PLAN: r0=132(x1), r1=89(y1), r2=382(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 89
LDI r2, 382
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
