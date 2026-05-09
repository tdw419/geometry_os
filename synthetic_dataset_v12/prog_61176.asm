; DESCRIPTION: Places a orange line segment connecting (358, 96) to (441, 244).
; PLAN: r0=358(x1), r1=96(y1), r2=441(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 96
LDI r2, 441
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
