; DESCRIPTION: Places a red line segment connecting (36, 64) to (50, 161).
; PLAN: r0=36(x1), r1=64(y1), r2=50(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 64
LDI r2, 50
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
