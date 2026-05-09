; DESCRIPTION: Draws a red line from (436, 132) to (342, 100).
; PLAN: r0=436(x1), r1=132(y1), r2=342(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 132
LDI r2, 342
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
