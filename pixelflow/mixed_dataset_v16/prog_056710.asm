; DESCRIPTION: Draws a green line from (288, 118) to (396, 247).
; PLAN: r0=288(x1), r1=118(y1), r2=396(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 118
LDI r2, 396
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
