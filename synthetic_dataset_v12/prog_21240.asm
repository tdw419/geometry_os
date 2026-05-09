; DESCRIPTION: Draws a red line from (349, 191) to (104, 1).
; PLAN: r0=349(x1), r1=191(y1), r2=104(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 191
LDI r2, 104
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
