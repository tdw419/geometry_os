; DESCRIPTION: Draws a red line from (199, 71) to (508, 216).
; PLAN: r0=199(x1), r1=71(y1), r2=508(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 71
LDI r2, 508
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
