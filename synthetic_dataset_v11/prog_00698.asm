; DESCRIPTION: Places a red line segment connecting (15, 128) to (174, 159).
; PLAN: r0=15(x1), r1=128(y1), r2=174(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 128
LDI r2, 174
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
