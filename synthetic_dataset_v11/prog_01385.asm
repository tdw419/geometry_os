; DESCRIPTION: Places a magenta line segment connecting (199, 213) to (214, 252).
; PLAN: r0=199(x1), r1=213(y1), r2=214(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 213
LDI r2, 214
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
