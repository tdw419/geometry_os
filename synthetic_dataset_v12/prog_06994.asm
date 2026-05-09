; DESCRIPTION: Draws a red line from (508, 31) to (149, 209).
; PLAN: r0=508(x1), r1=31(y1), r2=149(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 31
LDI r2, 149
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
