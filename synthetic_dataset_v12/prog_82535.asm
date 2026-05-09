; DESCRIPTION: Renders a red line between points (456, 193) and (84, 253).
; PLAN: r0=456(x1), r1=193(y1), r2=84(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 193
LDI r2, 84
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
