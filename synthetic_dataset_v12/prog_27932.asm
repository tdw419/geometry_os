; DESCRIPTION: Places a magenta line segment connecting (498, 67) to (480, 250).
; PLAN: r0=498(x1), r1=67(y1), r2=480(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 67
LDI r2, 480
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
