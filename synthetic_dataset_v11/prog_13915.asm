; DESCRIPTION: Draws a red line from (74, 200) to (205, 112).
; PLAN: r0=74(x1), r1=200(y1), r2=205(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 200
LDI r2, 205
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
