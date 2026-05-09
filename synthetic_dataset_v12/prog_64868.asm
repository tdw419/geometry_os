; DESCRIPTION: Places a magenta line segment connecting (287, 13) to (1, 166).
; PLAN: r0=287(x1), r1=13(y1), r2=1(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 13
LDI r2, 1
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
