; DESCRIPTION: Places a magenta line segment connecting (187, 221) to (201, 23).
; PLAN: r0=187(x1), r1=221(y1), r2=201(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 221
LDI r2, 201
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
