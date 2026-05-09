; DESCRIPTION: Places a magenta line segment connecting (178, 99) to (330, 24).
; PLAN: r0=178(x1), r1=99(y1), r2=330(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 99
LDI r2, 330
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
