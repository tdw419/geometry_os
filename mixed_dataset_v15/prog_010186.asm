; DESCRIPTION: Draws a red line from (343, 236) to (342, 92).
; PLAN: r0=343(x1), r1=236(y1), r2=342(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 236
LDI r2, 342
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
