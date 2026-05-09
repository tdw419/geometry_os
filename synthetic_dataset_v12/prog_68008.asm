; DESCRIPTION: Places a blue line segment connecting (442, 228) to (83, 112).
; PLAN: r0=442(x1), r1=228(y1), r2=83(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 228
LDI r2, 83
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
