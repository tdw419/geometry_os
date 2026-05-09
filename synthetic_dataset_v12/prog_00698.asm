; DESCRIPTION: Renders a red line between points (300, 12) and (418, 199).
; PLAN: r0=300(x1), r1=12(y1), r2=418(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 12
LDI r2, 418
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
