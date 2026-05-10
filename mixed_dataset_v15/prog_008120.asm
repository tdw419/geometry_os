; DESCRIPTION: Draws a red line from (204, 76) to (205, 78).
; PLAN: r0=204(x1), r1=76(y1), r2=205(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 76
LDI r2, 205
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
