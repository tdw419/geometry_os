; DESCRIPTION: Renders a red line between points (173, 190) and (137, 43).
; PLAN: r0=173(x1), r1=190(y1), r2=137(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 190
LDI r2, 137
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
