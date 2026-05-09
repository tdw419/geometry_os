; DESCRIPTION: Places a yellow line segment connecting (89, 217) to (49, 228).
; PLAN: r0=89(x1), r1=217(y1), r2=49(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 217
LDI r2, 49
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
