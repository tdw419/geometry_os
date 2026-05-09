; DESCRIPTION: Draws a red line from (216, 241) to (230, 140).
; PLAN: r0=216(x1), r1=241(y1), r2=230(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 241
LDI r2, 230
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
