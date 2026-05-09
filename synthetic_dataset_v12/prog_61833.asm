; DESCRIPTION: Renders a red line between points (439, 83) and (509, 95).
; PLAN: r0=439(x1), r1=83(y1), r2=509(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 83
LDI r2, 509
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
