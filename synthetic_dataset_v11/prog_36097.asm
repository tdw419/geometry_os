; DESCRIPTION: Places a magenta line segment connecting (54, 99) to (16, 222).
; PLAN: r0=54(x1), r1=99(y1), r2=16(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 99
LDI r2, 16
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
