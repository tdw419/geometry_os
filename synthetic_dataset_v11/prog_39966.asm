; DESCRIPTION: Draws a red line from (199, 24) to (26, 56).
; PLAN: r0=199(x1), r1=24(y1), r2=26(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 24
LDI r2, 26
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
