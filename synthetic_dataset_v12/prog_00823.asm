; DESCRIPTION: Places a orange line segment connecting (135, 180) to (301, 128).
; PLAN: r0=135(x1), r1=180(y1), r2=301(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 180
LDI r2, 301
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
