; DESCRIPTION: Draws a red line from (317, 191) to (97, 156).
; PLAN: r0=317(x1), r1=191(y1), r2=97(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 191
LDI r2, 97
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
