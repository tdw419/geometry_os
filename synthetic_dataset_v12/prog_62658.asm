; DESCRIPTION: Places a orange line segment connecting (180, 248) to (247, 133).
; PLAN: r0=180(x1), r1=248(y1), r2=247(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 248
LDI r2, 247
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
