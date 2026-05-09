; DESCRIPTION: Places a blue line segment connecting (263, 74) to (449, 45).
; PLAN: r0=263(x1), r1=74(y1), r2=449(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 74
LDI r2, 449
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
