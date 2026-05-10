; DESCRIPTION: Draws a red line from (36, 26) to (185, 38).
; PLAN: r0=36(x1), r1=26(y1), r2=185(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 26
LDI r2, 185
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
