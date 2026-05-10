; DESCRIPTION: Places a magenta line segment connecting (342, 246) to (376, 55).
; PLAN: r0=342(x1), r1=246(y1), r2=376(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 246
LDI r2, 376
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
