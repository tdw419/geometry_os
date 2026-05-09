; DESCRIPTION: Places a blue line segment connecting (217, 179) to (32, 93).
; PLAN: r0=217(x1), r1=179(y1), r2=32(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 179
LDI r2, 32
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
