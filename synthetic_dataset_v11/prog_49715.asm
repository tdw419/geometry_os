; DESCRIPTION: Draws a black line from (99, 23) to (189, 212).
; PLAN: r0=99(x1), r1=23(y1), r2=189(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 23
LDI r2, 189
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
