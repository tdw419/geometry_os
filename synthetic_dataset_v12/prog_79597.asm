; DESCRIPTION: Renders a red line between points (252, 80) and (83, 242).
; PLAN: r0=252(x1), r1=80(y1), r2=83(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 80
LDI r2, 83
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
