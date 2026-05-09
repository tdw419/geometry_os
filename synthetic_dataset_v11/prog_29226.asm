; DESCRIPTION: Places a orange line segment connecting (244, 32) to (249, 117).
; PLAN: r0=244(x1), r1=32(y1), r2=249(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 32
LDI r2, 249
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
