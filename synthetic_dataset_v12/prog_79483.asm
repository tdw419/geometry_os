; DESCRIPTION: Draws a red line from (369, 243) to (419, 249).
; PLAN: r0=369(x1), r1=243(y1), r2=419(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 243
LDI r2, 419
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
