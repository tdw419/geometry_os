; DESCRIPTION: Draws a red line from (333, 100) to (373, 77).
; PLAN: r0=333(x1), r1=100(y1), r2=373(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 100
LDI r2, 373
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
