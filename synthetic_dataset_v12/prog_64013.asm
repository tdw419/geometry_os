; DESCRIPTION: Draws a red line from (23, 100) to (122, 124).
; PLAN: r0=23(x1), r1=100(y1), r2=122(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 100
LDI r2, 122
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
