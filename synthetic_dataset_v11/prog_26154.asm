; DESCRIPTION: Draws a black line from (2, 34) to (156, 212).
; PLAN: r0=2(x1), r1=34(y1), r2=156(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 34
LDI r2, 156
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
