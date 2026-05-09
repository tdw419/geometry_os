; DESCRIPTION: Places a magenta line segment connecting (252, 135) to (126, 163).
; PLAN: r0=252(x1), r1=135(y1), r2=126(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 135
LDI r2, 126
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
