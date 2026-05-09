; DESCRIPTION: Places a orange line segment connecting (423, 192) to (346, 128).
; PLAN: r0=423(x1), r1=192(y1), r2=346(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 192
LDI r2, 346
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
