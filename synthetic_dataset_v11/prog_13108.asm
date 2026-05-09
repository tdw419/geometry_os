; DESCRIPTION: Places a blue line segment connecting (131, 174) to (228, 20).
; PLAN: r0=131(x1), r1=174(y1), r2=228(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 174
LDI r2, 228
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
