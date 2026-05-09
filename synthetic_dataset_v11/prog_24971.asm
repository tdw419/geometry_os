; DESCRIPTION: Places a orange line segment connecting (182, 255) to (210, 199).
; PLAN: r0=182(x1), r1=255(y1), r2=210(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 255
LDI r2, 210
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
