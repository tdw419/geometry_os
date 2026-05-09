; DESCRIPTION: Renders a red line between points (139, 16) and (454, 39).
; PLAN: r0=139(x1), r1=16(y1), r2=454(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 16
LDI r2, 454
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
