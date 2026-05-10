; DESCRIPTION: Places a red line segment connecting (87, 64) to (438, 2).
; PLAN: r0=87(x1), r1=64(y1), r2=438(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 64
LDI r2, 438
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
