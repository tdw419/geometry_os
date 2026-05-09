; DESCRIPTION: Places a red line segment connecting (438, 56) to (159, 16).
; PLAN: r0=438(x1), r1=56(y1), r2=159(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 56
LDI r2, 159
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
