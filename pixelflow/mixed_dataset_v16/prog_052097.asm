; DESCRIPTION: Draws a red line from (131, 104) to (408, 94).
; PLAN: r0=131(x1), r1=104(y1), r2=408(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 104
LDI r2, 408
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
