; DESCRIPTION: Draws a red line from (283, 37) to (148, 34).
; PLAN: r0=283(x1), r1=37(y1), r2=148(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 37
LDI r2, 148
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
