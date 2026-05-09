; DESCRIPTION: Draws a red line from (198, 191) to (159, 14).
; PLAN: r0=198(x1), r1=191(y1), r2=159(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 191
LDI r2, 159
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
