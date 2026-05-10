; DESCRIPTION: Places a blue line segment connecting (32, 60) to (408, 177).
; PLAN: r0=32(x1), r1=60(y1), r2=408(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 60
LDI r2, 408
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
