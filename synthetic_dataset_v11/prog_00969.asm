; DESCRIPTION: Places a blue line segment connecting (66, 21) to (195, 53).
; PLAN: r0=66(x1), r1=21(y1), r2=195(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 21
LDI r2, 195
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
