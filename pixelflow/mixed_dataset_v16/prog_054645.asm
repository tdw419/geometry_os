; DESCRIPTION: Places a magenta line segment connecting (214, 211) to (326, 64).
; PLAN: r0=214(x1), r1=211(y1), r2=326(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 211
LDI r2, 326
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
