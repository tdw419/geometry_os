; DESCRIPTION: Places a blue line segment connecting (342, 212) to (265, 61).
; PLAN: r0=342(x1), r1=212(y1), r2=265(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 212
LDI r2, 265
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
