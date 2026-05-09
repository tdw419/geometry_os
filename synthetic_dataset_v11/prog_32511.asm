; DESCRIPTION: Places a magenta line segment connecting (174, 249) to (62, 190).
; PLAN: r0=174(x1), r1=249(y1), r2=62(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 249
LDI r2, 62
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
