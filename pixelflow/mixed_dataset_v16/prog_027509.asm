; DESCRIPTION: Places a magenta line segment connecting (103, 167) to (250, 48).
; PLAN: r0=103(x1), r1=167(y1), r2=250(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 167
LDI r2, 250
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
