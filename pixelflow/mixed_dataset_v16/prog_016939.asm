; DESCRIPTION: Renders a red line between points (205, 156) and (418, 156).
; PLAN: r0=205(x1), r1=156(y1), r2=418(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 156
LDI r2, 418
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
