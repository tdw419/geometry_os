; DESCRIPTION: Renders a green line between points (112, 179) and (10, 29).
; PLAN: r0=112(x1), r1=179(y1), r2=10(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 179
LDI r2, 10
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
