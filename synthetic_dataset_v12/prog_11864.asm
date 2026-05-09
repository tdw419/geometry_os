; DESCRIPTION: Places a magenta line segment connecting (358, 254) to (461, 166).
; PLAN: r0=358(x1), r1=254(y1), r2=461(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 254
LDI r2, 461
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
