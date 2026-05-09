; DESCRIPTION: Places a magenta line segment connecting (219, 249) to (32, 109).
; PLAN: r0=219(x1), r1=249(y1), r2=32(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 249
LDI r2, 32
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
