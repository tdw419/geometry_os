; DESCRIPTION: Places a orange line segment connecting (173, 213) to (9, 23).
; PLAN: r0=173(x1), r1=213(y1), r2=9(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 213
LDI r2, 9
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
