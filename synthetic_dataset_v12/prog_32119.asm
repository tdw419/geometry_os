; DESCRIPTION: Places a magenta line segment connecting (85, 32) to (240, 231).
; PLAN: r0=85(x1), r1=32(y1), r2=240(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 32
LDI r2, 240
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
