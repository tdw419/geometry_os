; DESCRIPTION: Places a blue line segment connecting (333, 235) to (293, 168).
; PLAN: r0=333(x1), r1=235(y1), r2=293(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 235
LDI r2, 293
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
