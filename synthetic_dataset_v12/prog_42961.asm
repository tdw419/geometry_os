; DESCRIPTION: Places a magenta line segment connecting (429, 51) to (13, 214).
; PLAN: r0=429(x1), r1=51(y1), r2=13(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 51
LDI r2, 13
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
