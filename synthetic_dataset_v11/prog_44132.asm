; DESCRIPTION: Draws a yellow line from (99, 2) to (157, 250).
; PLAN: r0=99(x1), r1=2(y1), r2=157(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 2
LDI r2, 157
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
