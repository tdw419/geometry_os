; DESCRIPTION: Renders a red line between points (84, 237) and (94, 138).
; PLAN: r0=84(x1), r1=237(y1), r2=94(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 237
LDI r2, 94
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
