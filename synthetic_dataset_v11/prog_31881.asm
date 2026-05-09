; DESCRIPTION: Places a magenta line segment connecting (157, 168) to (175, 43).
; PLAN: r0=157(x1), r1=168(y1), r2=175(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 168
LDI r2, 175
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
