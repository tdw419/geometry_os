; DESCRIPTION: Places a magenta line segment connecting (459, 231) to (380, 22).
; PLAN: r0=459(x1), r1=231(y1), r2=380(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 231
LDI r2, 380
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
