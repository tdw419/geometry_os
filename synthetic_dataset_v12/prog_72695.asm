; DESCRIPTION: Renders a red line between points (405, 33) and (501, 78).
; PLAN: r0=405(x1), r1=33(y1), r2=501(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 33
LDI r2, 501
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
