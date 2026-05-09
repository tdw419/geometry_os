; DESCRIPTION: Draws a red line from (101, 75) to (131, 87).
; PLAN: r0=101(x1), r1=75(y1), r2=131(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 75
LDI r2, 131
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
