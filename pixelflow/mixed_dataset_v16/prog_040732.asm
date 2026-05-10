; DESCRIPTION: Places a orange line segment connecting (173, 194) to (234, 153).
; PLAN: r0=173(x1), r1=194(y1), r2=234(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 194
LDI r2, 234
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
