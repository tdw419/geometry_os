; DESCRIPTION: Places a red line segment connecting (141, 212) to (509, 64).
; PLAN: r0=141(x1), r1=212(y1), r2=509(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 212
LDI r2, 509
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
