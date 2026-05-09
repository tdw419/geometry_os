; DESCRIPTION: Draws a red line from (103, 145) to (216, 62).
; PLAN: r0=103(x1), r1=145(y1), r2=216(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 145
LDI r2, 216
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
