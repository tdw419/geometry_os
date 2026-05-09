; DESCRIPTION: Places a magenta line segment connecting (494, 53) to (18, 99).
; PLAN: r0=494(x1), r1=53(y1), r2=18(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 53
LDI r2, 18
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
