; DESCRIPTION: Draws a red line from (406, 105) to (285, 75).
; PLAN: r0=406(x1), r1=105(y1), r2=285(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 105
LDI r2, 285
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
