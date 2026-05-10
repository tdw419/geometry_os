; DESCRIPTION: Draws a red line from (507, 71) to (418, 131).
; PLAN: r0=507(x1), r1=71(y1), r2=418(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 71
LDI r2, 418
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
