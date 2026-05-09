; DESCRIPTION: Draws a red line from (369, 4) to (210, 124).
; PLAN: r0=369(x1), r1=4(y1), r2=210(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 4
LDI r2, 210
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
