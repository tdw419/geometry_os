; DESCRIPTION: Draws a red line from (285, 101) to (211, 127).
; PLAN: r0=285(x1), r1=101(y1), r2=211(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 101
LDI r2, 211
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
