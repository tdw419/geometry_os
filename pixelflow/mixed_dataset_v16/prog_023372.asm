; DESCRIPTION: Renders a red line between points (72, 81) and (215, 212).
; PLAN: r0=72(x1), r1=81(y1), r2=215(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 81
LDI r2, 215
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
