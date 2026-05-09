; DESCRIPTION: Draws a red line from (486, 131) to (7, 63).
; PLAN: r0=486(x1), r1=131(y1), r2=7(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 131
LDI r2, 7
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
