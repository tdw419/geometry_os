; DESCRIPTION: Draws a red line from (405, 153) to (26, 39).
; PLAN: r0=405(x1), r1=153(y1), r2=26(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 153
LDI r2, 26
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
