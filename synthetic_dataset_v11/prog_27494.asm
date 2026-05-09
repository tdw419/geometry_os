; DESCRIPTION: Places a magenta line segment connecting (183, 46) to (107, 231).
; PLAN: r0=183(x1), r1=46(y1), r2=107(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 46
LDI r2, 107
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
