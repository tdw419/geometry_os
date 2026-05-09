; DESCRIPTION: Places a magenta line segment connecting (281, 65) to (179, 158).
; PLAN: r0=281(x1), r1=65(y1), r2=179(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 65
LDI r2, 179
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
