; DESCRIPTION: Places a magenta line segment connecting (115, 126) to (495, 189).
; PLAN: r0=115(x1), r1=126(y1), r2=495(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 126
LDI r2, 495
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
