; DESCRIPTION: Draws a red line from (317, 191) to (289, 197).
; PLAN: r0=317(x1), r1=191(y1), r2=289(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 191
LDI r2, 289
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
