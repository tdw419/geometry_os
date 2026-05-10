; DESCRIPTION: Draws a red line from (185, 29) to (60, 53).
; PLAN: r0=185(x1), r1=29(y1), r2=60(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 29
LDI r2, 60
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
