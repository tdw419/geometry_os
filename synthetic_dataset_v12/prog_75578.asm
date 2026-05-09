; DESCRIPTION: Places a magenta line segment connecting (349, 19) to (219, 101).
; PLAN: r0=349(x1), r1=19(y1), r2=219(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 19
LDI r2, 219
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
