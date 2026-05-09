; DESCRIPTION: Places a magenta line segment connecting (162, 38) to (168, 141).
; PLAN: r0=162(x1), r1=38(y1), r2=168(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 38
LDI r2, 168
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
