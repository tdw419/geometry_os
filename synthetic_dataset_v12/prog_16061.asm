; DESCRIPTION: Draws a red line from (399, 55) to (352, 145).
; PLAN: r0=399(x1), r1=55(y1), r2=352(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 55
LDI r2, 352
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
