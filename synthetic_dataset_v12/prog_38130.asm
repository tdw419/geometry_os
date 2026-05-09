; DESCRIPTION: Renders a red line between points (347, 190) and (260, 107).
; PLAN: r0=347(x1), r1=190(y1), r2=260(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 190
LDI r2, 260
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
