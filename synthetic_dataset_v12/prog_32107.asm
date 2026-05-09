; DESCRIPTION: Places a yellow line segment connecting (123, 185) to (187, 191).
; PLAN: r0=123(x1), r1=185(y1), r2=187(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 185
LDI r2, 187
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
