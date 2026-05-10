; DESCRIPTION: Draws a red line from (433, 81) to (377, 142).
; PLAN: r0=433(x1), r1=81(y1), r2=377(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 81
LDI r2, 377
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
