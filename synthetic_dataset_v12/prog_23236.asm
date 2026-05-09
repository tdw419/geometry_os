; DESCRIPTION: Places a green line segment connecting (225, 65) to (123, 179).
; PLAN: r0=225(x1), r1=65(y1), r2=123(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 65
LDI r2, 123
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
