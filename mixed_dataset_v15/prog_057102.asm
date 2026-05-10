; DESCRIPTION: Places a green line segment connecting (123, 134) to (381, 56).
; PLAN: r0=123(x1), r1=134(y1), r2=381(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 134
LDI r2, 381
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
