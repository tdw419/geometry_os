; DESCRIPTION: Places a blue line segment connecting (177, 128) to (349, 231).
; PLAN: r0=177(x1), r1=128(y1), r2=349(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 128
LDI r2, 349
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
