; DESCRIPTION: Draws a red line from (325, 240) to (105, 36).
; PLAN: r0=325(x1), r1=240(y1), r2=105(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 240
LDI r2, 105
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
