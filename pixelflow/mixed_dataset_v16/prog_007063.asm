; DESCRIPTION: Draws a red line from (291, 211) to (155, 238).
; PLAN: r0=291(x1), r1=211(y1), r2=155(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 211
LDI r2, 155
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
