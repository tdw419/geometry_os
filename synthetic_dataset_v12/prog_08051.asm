; DESCRIPTION: Places a orange line segment connecting (217, 164) to (449, 246).
; PLAN: r0=217(x1), r1=164(y1), r2=449(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 164
LDI r2, 449
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
