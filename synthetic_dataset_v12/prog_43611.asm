; DESCRIPTION: Places a magenta line segment connecting (45, 103) to (11, 50).
; PLAN: r0=45(x1), r1=103(y1), r2=11(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 103
LDI r2, 11
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
