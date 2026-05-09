; DESCRIPTION: Places a magenta line segment connecting (167, 116) to (18, 3).
; PLAN: r0=167(x1), r1=116(y1), r2=18(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 116
LDI r2, 18
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
