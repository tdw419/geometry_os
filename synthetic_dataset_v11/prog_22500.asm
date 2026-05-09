; DESCRIPTION: Draws a black line from (102, 26) to (231, 78).
; PLAN: r0=102(x1), r1=26(y1), r2=231(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 26
LDI r2, 231
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
