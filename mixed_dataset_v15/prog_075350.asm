; DESCRIPTION: Places a magenta line segment connecting (144, 92) to (220, 24).
; PLAN: r0=144(x1), r1=92(y1), r2=220(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 92
LDI r2, 220
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
