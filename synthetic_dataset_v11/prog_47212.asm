; DESCRIPTION: Renders a purple line between points (82, 76) and (96, 21).
; PLAN: r0=82(x1), r1=76(y1), r2=96(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 76
LDI r2, 96
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
