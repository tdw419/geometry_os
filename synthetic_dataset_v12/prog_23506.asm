; DESCRIPTION: Places a magenta line segment connecting (339, 223) to (216, 213).
; PLAN: r0=339(x1), r1=223(y1), r2=216(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 223
LDI r2, 216
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
