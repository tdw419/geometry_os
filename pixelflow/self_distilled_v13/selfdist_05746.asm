; DESCRIPTION: Renders a red line segment connecting (231, 73) to (315, 168).
; PLAN: r0=231(x1), r1=73(y1), r2=315(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 73
LDI r2, 315
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
