; DESCRIPTION: Renders a red line between points (234, 65) and (94, 87).
; PLAN: r0=234(x1), r1=65(y1), r2=94(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 65
LDI r2, 94
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
