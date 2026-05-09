; DESCRIPTION: Places a magenta line segment connecting (223, 30) to (228, 252).
; PLAN: r0=223(x1), r1=30(y1), r2=228(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 30
LDI r2, 228
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
