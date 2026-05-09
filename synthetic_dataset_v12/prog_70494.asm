; DESCRIPTION: Draws a red line from (496, 190) to (322, 203).
; PLAN: r0=496(x1), r1=190(y1), r2=322(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 190
LDI r2, 322
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
