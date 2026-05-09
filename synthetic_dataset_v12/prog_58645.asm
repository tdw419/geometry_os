; DESCRIPTION: Places a orange line segment connecting (403, 172) to (183, 159).
; PLAN: r0=403(x1), r1=172(y1), r2=183(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 172
LDI r2, 183
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
