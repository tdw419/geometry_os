; DESCRIPTION: Renders a red line between points (95, 48) and (215, 251).
; PLAN: r0=95(x1), r1=48(y1), r2=215(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 48
LDI r2, 215
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
