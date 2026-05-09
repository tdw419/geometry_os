; DESCRIPTION: Draws a red line from (405, 58) to (47, 199).
; PLAN: r0=405(x1), r1=58(y1), r2=47(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 58
LDI r2, 47
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
