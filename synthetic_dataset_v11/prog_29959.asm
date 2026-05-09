; DESCRIPTION: Renders a red line between points (128, 219) and (141, 68).
; PLAN: r0=128(x1), r1=219(y1), r2=141(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 219
LDI r2, 141
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
