; DESCRIPTION: Draws a red line from (450, 194) to (454, 105).
; PLAN: r0=450(x1), r1=194(y1), r2=454(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 194
LDI r2, 454
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
