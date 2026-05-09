; DESCRIPTION: Places a blue line segment connecting (206, 144) to (241, 66).
; PLAN: r0=206(x1), r1=144(y1), r2=241(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 144
LDI r2, 241
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
