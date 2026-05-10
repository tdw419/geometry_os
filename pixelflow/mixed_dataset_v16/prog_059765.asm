; DESCRIPTION: Places a magenta line segment connecting (220, 40) to (47, 32).
; PLAN: r0=220(x1), r1=40(y1), r2=47(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 40
LDI r2, 47
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
