; DESCRIPTION: Places a magenta line segment connecting (382, 174) to (330, 22).
; PLAN: r0=382(x1), r1=174(y1), r2=330(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 174
LDI r2, 330
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
