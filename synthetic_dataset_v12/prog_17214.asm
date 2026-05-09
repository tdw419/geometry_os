; DESCRIPTION: Renders a magenta line between points (483, 47) and (176, 10).
; PLAN: r0=483(x1), r1=47(y1), r2=176(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 47
LDI r2, 176
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
