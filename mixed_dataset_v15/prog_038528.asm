; DESCRIPTION: Places a magenta line segment connecting (52, 72) to (123, 45).
; PLAN: r0=52(x1), r1=72(y1), r2=123(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 72
LDI r2, 123
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
