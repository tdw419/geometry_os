; DESCRIPTION: Draws a red line from (352, 211) to (3, 85).
; PLAN: r0=352(x1), r1=211(y1), r2=3(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 211
LDI r2, 3
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
