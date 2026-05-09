; DESCRIPTION: Renders a yellow line between points (220, 22) and (89, 57).
; PLAN: r0=220(x1), r1=22(y1), r2=89(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 22
LDI r2, 89
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
