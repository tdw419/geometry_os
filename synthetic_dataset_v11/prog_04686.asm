; DESCRIPTION: Places a magenta line segment connecting (166, 6) to (74, 156).
; PLAN: r0=166(x1), r1=6(y1), r2=74(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 6
LDI r2, 74
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
