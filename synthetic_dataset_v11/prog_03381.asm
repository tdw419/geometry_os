; DESCRIPTION: Draws a red line from (163, 18) to (245, 0).
; PLAN: r0=163(x1), r1=18(y1), r2=245(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 18
LDI r2, 245
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
