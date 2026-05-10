; DESCRIPTION: Places a orange line segment connecting (419, 253) to (361, 164).
; PLAN: r0=419(x1), r1=253(y1), r2=361(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 253
LDI r2, 361
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
