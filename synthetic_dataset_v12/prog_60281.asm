; DESCRIPTION: Renders a magenta line between points (423, 70) and (273, 73).
; PLAN: r0=423(x1), r1=70(y1), r2=273(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 70
LDI r2, 273
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
