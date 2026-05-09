; DESCRIPTION: Places a magenta line segment connecting (406, 63) to (103, 252).
; PLAN: r0=406(x1), r1=63(y1), r2=103(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 63
LDI r2, 103
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
