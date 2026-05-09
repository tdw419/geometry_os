; DESCRIPTION: Places a orange line segment connecting (444, 55) to (173, 70).
; PLAN: r0=444(x1), r1=55(y1), r2=173(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 55
LDI r2, 173
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
