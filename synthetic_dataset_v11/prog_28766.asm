; DESCRIPTION: Places a magenta line segment connecting (36, 184) to (173, 199).
; PLAN: r0=36(x1), r1=184(y1), r2=173(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 184
LDI r2, 173
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
