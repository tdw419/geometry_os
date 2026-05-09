; DESCRIPTION: Places a blue line segment connecting (352, 180) to (257, 142).
; PLAN: r0=352(x1), r1=180(y1), r2=257(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 180
LDI r2, 257
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
