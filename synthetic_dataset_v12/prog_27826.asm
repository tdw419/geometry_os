; DESCRIPTION: Draws a red line from (423, 172) to (91, 53).
; PLAN: r0=423(x1), r1=172(y1), r2=91(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 172
LDI r2, 91
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
