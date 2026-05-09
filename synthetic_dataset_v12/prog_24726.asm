; DESCRIPTION: Places a magenta line segment connecting (329, 153) to (220, 22).
; PLAN: r0=329(x1), r1=153(y1), r2=220(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 153
LDI r2, 220
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
