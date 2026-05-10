; DESCRIPTION: Places a magenta line segment connecting (239, 36) to (247, 155).
; PLAN: r0=239(x1), r1=36(y1), r2=247(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 36
LDI r2, 247
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
