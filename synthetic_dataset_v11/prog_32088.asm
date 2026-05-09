; DESCRIPTION: Places a magenta line segment connecting (142, 205) to (241, 56).
; PLAN: r0=142(x1), r1=205(y1), r2=241(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 205
LDI r2, 241
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
