; DESCRIPTION: Places a magenta line segment connecting (123, 73) to (7, 233).
; PLAN: r0=123(x1), r1=73(y1), r2=7(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 73
LDI r2, 7
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
