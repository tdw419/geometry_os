; DESCRIPTION: Places a magenta line segment connecting (126, 141) to (157, 217).
; PLAN: r0=126(x1), r1=141(y1), r2=157(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 141
LDI r2, 157
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
