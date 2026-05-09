; DESCRIPTION: Places a magenta line segment connecting (417, 151) to (134, 244).
; PLAN: r0=417(x1), r1=151(y1), r2=134(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 151
LDI r2, 134
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
