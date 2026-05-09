; DESCRIPTION: Draws a green line from (318, 61) to (88, 6).
; PLAN: r0=318(x1), r1=61(y1), r2=88(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 61
LDI r2, 88
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
