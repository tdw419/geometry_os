; DESCRIPTION: Places a magenta line segment connecting (131, 163) to (161, 192).
; PLAN: r0=131(x1), r1=163(y1), r2=161(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 163
LDI r2, 161
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
