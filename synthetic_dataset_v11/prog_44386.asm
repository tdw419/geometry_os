; DESCRIPTION: Draws a red line from (18, 131) to (185, 123).
; PLAN: r0=18(x1), r1=131(y1), r2=185(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 131
LDI r2, 185
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
