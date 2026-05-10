; DESCRIPTION: Places a purple line segment connecting (16, 234) to (91, 207).
; PLAN: r0=16(x1), r1=234(y1), r2=91(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 234
LDI r2, 91
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
