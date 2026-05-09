; DESCRIPTION: Renders a magenta line between points (192, 99) and (142, 95).
; PLAN: r0=192(x1), r1=99(y1), r2=142(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 99
LDI r2, 142
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
