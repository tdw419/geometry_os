; DESCRIPTION: Draws a red line from (231, 232) to (19, 216).
; PLAN: r0=231(x1), r1=232(y1), r2=19(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 232
LDI r2, 19
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
