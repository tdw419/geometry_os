; DESCRIPTION: Draws a red line from (33, 100) to (110, 139).
; PLAN: r0=33(x1), r1=100(y1), r2=110(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 100
LDI r2, 110
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
