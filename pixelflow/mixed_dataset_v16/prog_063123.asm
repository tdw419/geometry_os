; DESCRIPTION: Draws a green line from (155, 97) to (419, 36).
; PLAN: r0=155(x1), r1=97(y1), r2=419(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 97
LDI r2, 419
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
