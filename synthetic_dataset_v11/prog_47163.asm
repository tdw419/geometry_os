; DESCRIPTION: Places a green line segment connecting (255, 207) to (195, 106).
; PLAN: r0=255(x1), r1=207(y1), r2=195(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 207
LDI r2, 195
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
