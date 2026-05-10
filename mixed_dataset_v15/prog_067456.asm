; DESCRIPTION: Places a magenta line segment connecting (32, 161) to (67, 205).
; PLAN: r0=32(x1), r1=161(y1), r2=67(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 161
LDI r2, 67
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
