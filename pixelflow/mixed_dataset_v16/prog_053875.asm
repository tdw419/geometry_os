; DESCRIPTION: Places a magenta line segment connecting (265, 104) to (377, 139).
; PLAN: r0=265(x1), r1=104(y1), r2=377(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 104
LDI r2, 377
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
