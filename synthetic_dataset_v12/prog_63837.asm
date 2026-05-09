; DESCRIPTION: Places a blue line segment connecting (378, 45) to (184, 113).
; PLAN: r0=378(x1), r1=45(y1), r2=184(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 45
LDI r2, 184
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
