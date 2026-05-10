; DESCRIPTION: Places a magenta line segment connecting (265, 61) to (112, 255).
; PLAN: r0=265(x1), r1=61(y1), r2=112(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 61
LDI r2, 112
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
