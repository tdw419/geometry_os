; DESCRIPTION: Draws a white line from (216, 59) to (155, 168).
; PLAN: r0=216(x1), r1=59(y1), r2=155(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 59
LDI r2, 155
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
