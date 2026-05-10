; DESCRIPTION: Renders a red line between points (441, 24) and (102, 39).
; PLAN: r0=441(x1), r1=24(y1), r2=102(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 24
LDI r2, 102
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
