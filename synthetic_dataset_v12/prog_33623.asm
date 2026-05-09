; DESCRIPTION: Places a orange line segment connecting (418, 128) to (150, 16).
; PLAN: r0=418(x1), r1=128(y1), r2=150(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 128
LDI r2, 150
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
