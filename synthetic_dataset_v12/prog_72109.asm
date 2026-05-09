; DESCRIPTION: Places a blue line segment connecting (42, 177) to (490, 30).
; PLAN: r0=42(x1), r1=177(y1), r2=490(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 177
LDI r2, 490
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
