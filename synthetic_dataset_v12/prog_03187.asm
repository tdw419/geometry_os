; DESCRIPTION: Places a red line segment connecting (481, 255) to (73, 133).
; PLAN: r0=481(x1), r1=255(y1), r2=73(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 255
LDI r2, 73
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
