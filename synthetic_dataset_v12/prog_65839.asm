; DESCRIPTION: Places a magenta line segment connecting (415, 75) to (24, 231).
; PLAN: r0=415(x1), r1=75(y1), r2=24(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 75
LDI r2, 24
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
