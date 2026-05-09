; DESCRIPTION: Renders a cyan line between points (145, 216) and (43, 185).
; PLAN: r0=145(x1), r1=216(y1), r2=43(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 216
LDI r2, 43
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
