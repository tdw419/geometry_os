; DESCRIPTION: Draws a red line from (381, 93) to (400, 25).
; PLAN: r0=381(x1), r1=93(y1), r2=400(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 93
LDI r2, 400
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
