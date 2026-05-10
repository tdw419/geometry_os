; DESCRIPTION: Places a orange line segment connecting (181, 64) to (301, 173).
; PLAN: r0=181(x1), r1=64(y1), r2=301(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 64
LDI r2, 301
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
