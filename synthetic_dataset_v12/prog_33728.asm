; DESCRIPTION: Places a magenta line segment connecting (368, 39) to (108, 156).
; PLAN: r0=368(x1), r1=39(y1), r2=108(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 39
LDI r2, 108
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
