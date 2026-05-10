; DESCRIPTION: Draws a red line from (508, 108) to (93, 14).
; PLAN: r0=508(x1), r1=108(y1), r2=93(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 108
LDI r2, 93
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
