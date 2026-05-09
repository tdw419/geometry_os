; DESCRIPTION: Places a blue line segment connecting (231, 215) to (472, 57).
; PLAN: r0=231(x1), r1=215(y1), r2=472(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 215
LDI r2, 472
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
