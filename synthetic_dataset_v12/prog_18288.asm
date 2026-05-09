; DESCRIPTION: Draws a red line from (361, 20) to (287, 127).
; PLAN: r0=361(x1), r1=20(y1), r2=287(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 20
LDI r2, 287
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
