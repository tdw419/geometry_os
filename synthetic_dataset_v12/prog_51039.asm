; DESCRIPTION: Draws a red line from (325, 113) to (370, 77).
; PLAN: r0=325(x1), r1=113(y1), r2=370(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 113
LDI r2, 370
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
