; DESCRIPTION: Places a orange line segment connecting (194, 179) to (113, 255).
; PLAN: r0=194(x1), r1=179(y1), r2=113(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 179
LDI r2, 113
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
