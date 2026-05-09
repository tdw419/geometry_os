; DESCRIPTION: Draws a white line from (190, 11) to (231, 137).
; PLAN: r0=190(x1), r1=11(y1), r2=231(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 11
LDI r2, 231
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
