; DESCRIPTION: Places a magenta line segment connecting (347, 227) to (401, 81).
; PLAN: r0=347(x1), r1=227(y1), r2=401(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 227
LDI r2, 401
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
