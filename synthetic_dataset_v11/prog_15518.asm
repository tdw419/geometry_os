; DESCRIPTION: Renders a red line between points (159, 143) and (46, 12).
; PLAN: r0=159(x1), r1=143(y1), r2=46(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 143
LDI r2, 46
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
