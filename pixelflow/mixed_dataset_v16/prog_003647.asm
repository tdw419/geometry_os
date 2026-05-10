; DESCRIPTION: Renders a red line between points (488, 144) and (29, 157).
; PLAN: r0=488(x1), r1=144(y1), r2=29(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 144
LDI r2, 29
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
