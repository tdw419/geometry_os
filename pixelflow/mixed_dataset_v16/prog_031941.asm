; DESCRIPTION: Places a red line segment connecting (152, 64) to (238, 141).
; PLAN: r0=152(x1), r1=64(y1), r2=238(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 64
LDI r2, 238
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
