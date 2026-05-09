; DESCRIPTION: Renders a blue line between points (276, 10) and (94, 65).
; PLAN: r0=276(x1), r1=10(y1), r2=94(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 10
LDI r2, 94
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
