; DESCRIPTION: Renders a red line between points (245, 180) and (149, 188).
; PLAN: r0=245(x1), r1=180(y1), r2=149(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 180
LDI r2, 149
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
