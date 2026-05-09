; DESCRIPTION: Renders a purple line between points (286, 145) and (295, 94).
; PLAN: r0=286(x1), r1=145(y1), r2=295(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 145
LDI r2, 295
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
