; DESCRIPTION: Places a blue line segment connecting (225, 153) to (231, 195).
; PLAN: r0=225(x1), r1=153(y1), r2=231(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 153
LDI r2, 231
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
