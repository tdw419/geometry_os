; DESCRIPTION: Places a magenta line segment connecting (59, 162) to (27, 189).
; PLAN: r0=59(x1), r1=162(y1), r2=27(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 162
LDI r2, 27
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
