; DESCRIPTION: Places a magenta line segment connecting (139, 16) to (154, 186).
; PLAN: r0=139(x1), r1=16(y1), r2=154(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 16
LDI r2, 154
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
