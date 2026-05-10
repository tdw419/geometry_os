; DESCRIPTION: Draws a red line from (396, 247) to (77, 67).
; PLAN: r0=396(x1), r1=247(y1), r2=77(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 247
LDI r2, 77
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
