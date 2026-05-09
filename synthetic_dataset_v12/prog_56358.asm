; DESCRIPTION: Places a magenta line segment connecting (495, 5) to (371, 50).
; PLAN: r0=495(x1), r1=5(y1), r2=371(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 5
LDI r2, 371
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
