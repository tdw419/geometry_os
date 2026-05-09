; DESCRIPTION: Draws a blue line from (486, 7) to (399, 207).
; PLAN: r0=486(x1), r1=7(y1), r2=399(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 7
LDI r2, 399
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
