; DESCRIPTION: Places a magenta line segment connecting (299, 86) to (327, 1).
; PLAN: r0=299(x1), r1=86(y1), r2=327(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 86
LDI r2, 327
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
