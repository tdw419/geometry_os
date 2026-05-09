; DESCRIPTION: Places a red line segment connecting (51, 156) to (405, 55).
; PLAN: r0=51(x1), r1=156(y1), r2=405(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 156
LDI r2, 405
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
