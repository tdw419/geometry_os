; DESCRIPTION: Draws a red line from (100, 185) to (405, 16).
; PLAN: r0=100(x1), r1=185(y1), r2=405(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 185
LDI r2, 405
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
