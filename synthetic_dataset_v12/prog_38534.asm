; DESCRIPTION: Draws a red line from (442, 77) to (7, 227).
; PLAN: r0=442(x1), r1=77(y1), r2=7(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 77
LDI r2, 7
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
