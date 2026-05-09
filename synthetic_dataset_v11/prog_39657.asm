; DESCRIPTION: Places a blue line segment connecting (209, 42) to (158, 234).
; PLAN: r0=209(x1), r1=42(y1), r2=158(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 42
LDI r2, 158
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
