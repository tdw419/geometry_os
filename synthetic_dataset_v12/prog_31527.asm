; DESCRIPTION: Renders a red line between points (511, 195) and (308, 155).
; PLAN: r0=511(x1), r1=195(y1), r2=308(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 195
LDI r2, 308
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
