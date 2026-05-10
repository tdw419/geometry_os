; DESCRIPTION: Places a orange line segment connecting (32, 48) to (353, 254).
; PLAN: r0=32(x1), r1=48(y1), r2=353(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 48
LDI r2, 353
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
