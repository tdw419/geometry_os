; DESCRIPTION: Draws a red line from (285, 179) to (142, 247).
; PLAN: r0=285(x1), r1=179(y1), r2=142(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 179
LDI r2, 142
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
