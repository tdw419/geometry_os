; DESCRIPTION: Renders a yellow line between points (363, 114) and (249, 161).
; PLAN: r0=363(x1), r1=114(y1), r2=249(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 114
LDI r2, 249
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
