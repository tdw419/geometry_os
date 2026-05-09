; DESCRIPTION: Draws a black line from (84, 229) to (93, 93).
; PLAN: r0=84(x1), r1=229(y1), r2=93(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 229
LDI r2, 93
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
