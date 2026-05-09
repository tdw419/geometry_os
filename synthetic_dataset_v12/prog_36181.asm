; DESCRIPTION: Renders a white line between points (499, 190) and (342, 98).
; PLAN: r0=499(x1), r1=190(y1), r2=342(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 190
LDI r2, 342
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
