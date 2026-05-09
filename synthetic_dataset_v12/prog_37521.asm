; DESCRIPTION: Renders a red line between points (190, 76) and (144, 242).
; PLAN: r0=190(x1), r1=76(y1), r2=144(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 76
LDI r2, 144
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
