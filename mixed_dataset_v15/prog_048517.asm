; DESCRIPTION: Places a magenta line segment connecting (504, 210) to (56, 74).
; PLAN: r0=504(x1), r1=210(y1), r2=56(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 210
LDI r2, 56
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
