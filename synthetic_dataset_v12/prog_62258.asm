; DESCRIPTION: Places a orange line segment connecting (293, 253) to (477, 246).
; PLAN: r0=293(x1), r1=253(y1), r2=477(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 253
LDI r2, 477
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
