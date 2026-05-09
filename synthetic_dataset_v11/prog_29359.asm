; DESCRIPTION: Draws a red line from (17, 99) to (13, 216).
; PLAN: r0=17(x1), r1=99(y1), r2=13(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 99
LDI r2, 13
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
