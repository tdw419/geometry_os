; DESCRIPTION: Places a magenta line segment connecting (324, 214) to (498, 180).
; PLAN: r0=324(x1), r1=214(y1), r2=498(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 214
LDI r2, 498
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
