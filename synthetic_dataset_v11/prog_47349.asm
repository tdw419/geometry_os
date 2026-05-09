; DESCRIPTION: Places a green line segment connecting (154, 162) to (170, 234).
; PLAN: r0=154(x1), r1=162(y1), r2=170(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 162
LDI r2, 170
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
