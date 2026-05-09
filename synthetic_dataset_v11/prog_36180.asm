; DESCRIPTION: Draws a red line from (190, 232) to (214, 234).
; PLAN: r0=190(x1), r1=232(y1), r2=214(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 232
LDI r2, 214
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
