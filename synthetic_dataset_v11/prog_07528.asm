; DESCRIPTION: Places a magenta line segment connecting (139, 111) to (5, 150).
; PLAN: r0=139(x1), r1=111(y1), r2=5(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 111
LDI r2, 5
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
