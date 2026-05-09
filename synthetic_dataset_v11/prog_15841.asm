; DESCRIPTION: Draws a red line from (214, 191) to (9, 252).
; PLAN: r0=214(x1), r1=191(y1), r2=9(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 191
LDI r2, 9
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
