; DESCRIPTION: Draws a red line from (165, 3) to (56, 206).
; PLAN: r0=165(x1), r1=3(y1), r2=56(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 3
LDI r2, 56
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
