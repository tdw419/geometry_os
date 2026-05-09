; DESCRIPTION: Places a magenta line segment connecting (33, 224) to (505, 68).
; PLAN: r0=33(x1), r1=224(y1), r2=505(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 224
LDI r2, 505
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
