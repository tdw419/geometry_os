; DESCRIPTION: Places a magenta line segment connecting (167, 179) to (161, 59).
; PLAN: r0=167(x1), r1=179(y1), r2=161(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 179
LDI r2, 161
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
