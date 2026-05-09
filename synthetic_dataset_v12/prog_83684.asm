; DESCRIPTION: Places a magenta line segment connecting (77, 214) to (282, 0).
; PLAN: r0=77(x1), r1=214(y1), r2=282(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 214
LDI r2, 282
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
