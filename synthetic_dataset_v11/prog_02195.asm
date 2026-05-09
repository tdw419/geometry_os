; DESCRIPTION: Places a magenta line segment connecting (47, 16) to (25, 61).
; PLAN: r0=47(x1), r1=16(y1), r2=25(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 16
LDI r2, 25
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
