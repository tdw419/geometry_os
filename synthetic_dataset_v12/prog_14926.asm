; DESCRIPTION: Places a magenta line segment connecting (8, 217) to (268, 95).
; PLAN: r0=8(x1), r1=217(y1), r2=268(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 217
LDI r2, 268
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
