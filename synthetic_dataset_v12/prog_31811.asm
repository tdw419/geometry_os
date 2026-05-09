; DESCRIPTION: Places a magenta line segment connecting (379, 71) to (339, 228).
; PLAN: r0=379(x1), r1=71(y1), r2=339(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 71
LDI r2, 339
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
