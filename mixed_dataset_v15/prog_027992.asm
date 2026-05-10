; DESCRIPTION: Places a orange line segment connecting (19, 64) to (135, 221).
; PLAN: r0=19(x1), r1=64(y1), r2=135(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 64
LDI r2, 135
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
