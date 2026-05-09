; DESCRIPTION: Draws a red line from (216, 188) to (29, 214).
; PLAN: r0=216(x1), r1=188(y1), r2=29(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 188
LDI r2, 29
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
