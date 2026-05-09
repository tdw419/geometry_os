; DESCRIPTION: Places a yellow line segment connecting (414, 37) to (117, 150).
; PLAN: r0=414(x1), r1=37(y1), r2=117(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 37
LDI r2, 117
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
