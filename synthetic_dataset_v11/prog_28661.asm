; DESCRIPTION: Draws a yellow line from (180, 191) to (85, 93).
; PLAN: r0=180(x1), r1=191(y1), r2=85(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 191
LDI r2, 85
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
