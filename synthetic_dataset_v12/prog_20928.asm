; DESCRIPTION: Places a magenta line segment connecting (122, 151) to (345, 68).
; PLAN: r0=122(x1), r1=151(y1), r2=345(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 151
LDI r2, 345
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
