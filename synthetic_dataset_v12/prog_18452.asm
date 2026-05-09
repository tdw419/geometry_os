; DESCRIPTION: Places a green line segment connecting (464, 139) to (221, 137).
; PLAN: r0=464(x1), r1=139(y1), r2=221(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 139
LDI r2, 221
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
