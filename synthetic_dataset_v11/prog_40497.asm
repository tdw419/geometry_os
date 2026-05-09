; DESCRIPTION: Places a magenta line segment connecting (154, 204) to (139, 230).
; PLAN: r0=154(x1), r1=204(y1), r2=139(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 204
LDI r2, 139
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
