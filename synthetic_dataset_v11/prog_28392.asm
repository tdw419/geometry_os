; DESCRIPTION: Places a magenta line segment connecting (5, 100) to (213, 209).
; PLAN: r0=5(x1), r1=100(y1), r2=213(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 100
LDI r2, 213
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
