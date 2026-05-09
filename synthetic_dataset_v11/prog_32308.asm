; DESCRIPTION: Draws a black line from (23, 190) to (241, 176).
; PLAN: r0=23(x1), r1=190(y1), r2=241(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 190
LDI r2, 241
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
