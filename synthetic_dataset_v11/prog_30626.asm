; DESCRIPTION: Places a blue line segment connecting (53, 13) to (123, 177).
; PLAN: r0=53(x1), r1=13(y1), r2=123(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 13
LDI r2, 123
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
