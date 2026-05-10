; DESCRIPTION: Renders a red line between points (19, 135) and (351, 40).
; PLAN: r0=19(x1), r1=135(y1), r2=351(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 135
LDI r2, 351
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
