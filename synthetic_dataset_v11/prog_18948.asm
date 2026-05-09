; DESCRIPTION: Places a blue line segment connecting (32, 141) to (66, 167).
; PLAN: r0=32(x1), r1=141(y1), r2=66(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 141
LDI r2, 66
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
