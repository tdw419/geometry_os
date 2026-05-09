; DESCRIPTION: Renders a green line between points (86, 77) and (65, 97).
; PLAN: r0=86(x1), r1=77(y1), r2=65(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 77
LDI r2, 65
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
