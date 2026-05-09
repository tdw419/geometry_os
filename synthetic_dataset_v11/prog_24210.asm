; DESCRIPTION: Renders a yellow line between points (6, 66) and (115, 150).
; PLAN: r0=6(x1), r1=66(y1), r2=115(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 66
LDI r2, 115
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
