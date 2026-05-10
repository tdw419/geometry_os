; DESCRIPTION: Places a magenta line segment connecting (333, 250) to (1, 231).
; PLAN: r0=333(x1), r1=250(y1), r2=1(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 250
LDI r2, 1
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
