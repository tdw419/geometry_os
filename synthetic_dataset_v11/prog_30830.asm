; DESCRIPTION: Places a magenta line segment connecting (228, 138) to (70, 92).
; PLAN: r0=228(x1), r1=138(y1), r2=70(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 138
LDI r2, 70
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
