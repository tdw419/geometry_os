; DESCRIPTION: Renders a magenta line between points (231, 71) and (22, 80).
; PLAN: r0=231(x1), r1=71(y1), r2=22(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 71
LDI r2, 22
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
