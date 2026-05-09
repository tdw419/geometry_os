; DESCRIPTION: Places a magenta line segment connecting (252, 64) to (183, 193).
; PLAN: r0=252(x1), r1=64(y1), r2=183(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 64
LDI r2, 183
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
