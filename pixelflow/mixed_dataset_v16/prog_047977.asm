; DESCRIPTION: Draws a red line from (241, 13) to (317, 177).
; PLAN: r0=241(x1), r1=13(y1), r2=317(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 13
LDI r2, 317
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
