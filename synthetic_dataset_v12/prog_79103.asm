; DESCRIPTION: Places a green line segment connecting (191, 142) to (123, 127).
; PLAN: r0=191(x1), r1=142(y1), r2=123(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 142
LDI r2, 123
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
