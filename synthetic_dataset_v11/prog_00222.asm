; DESCRIPTION: Places a magenta line segment connecting (40, 117) to (16, 4).
; PLAN: r0=40(x1), r1=117(y1), r2=16(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 117
LDI r2, 16
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
