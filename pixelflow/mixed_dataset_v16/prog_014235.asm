; DESCRIPTION: Places a orange line segment connecting (487, 64) to (464, 217).
; PLAN: r0=487(x1), r1=64(y1), r2=464(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 64
LDI r2, 464
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
