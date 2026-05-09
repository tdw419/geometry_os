; DESCRIPTION: Places a orange line segment connecting (510, 159) to (195, 133).
; PLAN: r0=510(x1), r1=159(y1), r2=195(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 159
LDI r2, 195
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
