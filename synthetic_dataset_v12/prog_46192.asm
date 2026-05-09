; DESCRIPTION: Places a red line segment connecting (251, 64) to (251, 128).
; PLAN: r0=251(x1), r1=64(y1), r2=251(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 64
LDI r2, 251
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
