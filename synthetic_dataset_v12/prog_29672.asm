; DESCRIPTION: Places a cyan line segment connecting (201, 225) to (455, 133).
; PLAN: r0=201(x1), r1=225(y1), r2=455(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 225
LDI r2, 455
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
