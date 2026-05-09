; DESCRIPTION: Draws a orange line from (487, 78) to (383, 60).
; PLAN: r0=487(x1), r1=78(y1), r2=383(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 78
LDI r2, 383
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
