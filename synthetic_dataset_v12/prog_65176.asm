; DESCRIPTION: Places a magenta line segment connecting (342, 53) to (460, 56).
; PLAN: r0=342(x1), r1=53(y1), r2=460(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 53
LDI r2, 460
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
