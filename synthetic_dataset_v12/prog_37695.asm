; DESCRIPTION: Renders a magenta line between points (249, 73) and (250, 4).
; PLAN: r0=249(x1), r1=73(y1), r2=250(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 73
LDI r2, 250
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
