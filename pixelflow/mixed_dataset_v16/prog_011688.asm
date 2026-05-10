; DESCRIPTION: Draws a red line from (413, 178) to (142, 12).
; PLAN: r0=413(x1), r1=178(y1), r2=142(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 178
LDI r2, 142
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
