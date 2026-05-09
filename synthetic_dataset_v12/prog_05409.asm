; DESCRIPTION: Places a magenta line segment connecting (504, 70) to (494, 196).
; PLAN: r0=504(x1), r1=70(y1), r2=494(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 70
LDI r2, 494
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
