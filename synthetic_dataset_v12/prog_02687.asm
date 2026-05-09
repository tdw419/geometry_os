; DESCRIPTION: Draws a orange line from (443, 96) to (397, 199).
; PLAN: r0=443(x1), r1=96(y1), r2=397(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 96
LDI r2, 397
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
