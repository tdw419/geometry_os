; DESCRIPTION: Places a magenta line segment connecting (30, 3) to (50, 50).
; PLAN: r0=30(x1), r1=3(y1), r2=50(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 3
LDI r2, 50
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
