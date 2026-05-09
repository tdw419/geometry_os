; DESCRIPTION: Renders a red line between points (11, 207) and (44, 251).
; PLAN: r0=11(x1), r1=207(y1), r2=44(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 207
LDI r2, 44
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
