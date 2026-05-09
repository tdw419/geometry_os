; DESCRIPTION: Places a magenta line segment connecting (23, 121) to (154, 93).
; PLAN: r0=23(x1), r1=121(y1), r2=154(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 121
LDI r2, 154
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
