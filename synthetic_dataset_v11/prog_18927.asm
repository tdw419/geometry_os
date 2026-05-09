; DESCRIPTION: Places a yellow line segment connecting (212, 67) to (166, 127).
; PLAN: r0=212(x1), r1=67(y1), r2=166(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 67
LDI r2, 166
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
