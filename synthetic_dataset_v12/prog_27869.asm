; DESCRIPTION: Places a magenta line segment connecting (131, 35) to (81, 59).
; PLAN: r0=131(x1), r1=35(y1), r2=81(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 35
LDI r2, 81
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
