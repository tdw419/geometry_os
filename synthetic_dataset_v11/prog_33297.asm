; DESCRIPTION: Draws a red line from (236, 40) to (148, 6).
; PLAN: r0=236(x1), r1=40(y1), r2=148(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 40
LDI r2, 148
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
