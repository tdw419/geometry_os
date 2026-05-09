; DESCRIPTION: Draws a red line from (13, 37) to (137, 14).
; PLAN: r0=13(x1), r1=37(y1), r2=137(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 37
LDI r2, 137
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
