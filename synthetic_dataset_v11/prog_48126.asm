; DESCRIPTION: Places a black line segment connecting (241, 190) to (115, 214).
; PLAN: r0=241(x1), r1=190(y1), r2=115(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 190
LDI r2, 115
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
