; DESCRIPTION: Places a blue line segment connecting (257, 133) to (377, 174).
; PLAN: r0=257(x1), r1=133(y1), r2=377(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 133
LDI r2, 377
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
