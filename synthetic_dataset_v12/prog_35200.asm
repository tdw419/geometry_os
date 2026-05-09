; DESCRIPTION: Draws a red line from (191, 95) to (8, 131).
; PLAN: r0=191(x1), r1=95(y1), r2=8(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 95
LDI r2, 8
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
