; DESCRIPTION: Places a magenta line segment connecting (22, 74) to (50, 231).
; PLAN: r0=22(x1), r1=74(y1), r2=50(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 74
LDI r2, 50
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
