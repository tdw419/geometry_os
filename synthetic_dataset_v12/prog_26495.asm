; DESCRIPTION: Places a red line segment connecting (251, 192) to (307, 168).
; PLAN: r0=251(x1), r1=192(y1), r2=307(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 192
LDI r2, 307
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
