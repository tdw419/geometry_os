; DESCRIPTION: Places a magenta line segment connecting (372, 123) to (128, 38).
; PLAN: r0=372(x1), r1=123(y1), r2=128(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 123
LDI r2, 128
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
