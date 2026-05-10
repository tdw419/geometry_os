; DESCRIPTION: Draws a red line from (376, 160) to (39, 17).
; PLAN: r0=376(x1), r1=160(y1), r2=39(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 160
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
