; DESCRIPTION: Renders a red line between points (208, 143) and (128, 148).
; PLAN: r0=208(x1), r1=143(y1), r2=128(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 143
LDI r2, 128
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
