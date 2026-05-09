; DESCRIPTION: Renders a red line between points (283, 235) and (418, 106).
; PLAN: r0=283(x1), r1=235(y1), r2=418(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 235
LDI r2, 418
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
