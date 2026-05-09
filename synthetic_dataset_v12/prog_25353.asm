; DESCRIPTION: Renders a red line between points (335, 76) and (493, 156).
; PLAN: r0=335(x1), r1=76(y1), r2=493(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 76
LDI r2, 493
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
