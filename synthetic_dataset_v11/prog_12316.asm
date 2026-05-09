; DESCRIPTION: Places a orange line segment connecting (39, 193) to (143, 38).
; PLAN: r0=39(x1), r1=193(y1), r2=143(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 193
LDI r2, 143
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
