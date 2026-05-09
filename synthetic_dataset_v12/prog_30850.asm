; DESCRIPTION: Renders a red line between points (481, 160) and (128, 118).
; PLAN: r0=481(x1), r1=160(y1), r2=128(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 160
LDI r2, 128
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
