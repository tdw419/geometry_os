; DESCRIPTION: Places a magenta line segment connecting (134, 42) to (495, 199).
; PLAN: r0=134(x1), r1=42(y1), r2=495(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 42
LDI r2, 495
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
