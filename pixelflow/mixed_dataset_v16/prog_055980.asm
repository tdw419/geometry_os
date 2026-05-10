; DESCRIPTION: Places a magenta line segment connecting (103, 0) to (338, 102).
; PLAN: r0=103(x1), r1=0(y1), r2=338(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 0
LDI r2, 338
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
