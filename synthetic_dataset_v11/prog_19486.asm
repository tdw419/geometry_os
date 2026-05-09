; DESCRIPTION: Renders a green line between points (95, 143) and (181, 95).
; PLAN: r0=95(x1), r1=143(y1), r2=181(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 143
LDI r2, 181
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
