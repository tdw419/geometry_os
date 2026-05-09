; DESCRIPTION: Places a orange line segment connecting (337, 196) to (434, 244).
; PLAN: r0=337(x1), r1=196(y1), r2=434(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 196
LDI r2, 434
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
