; DESCRIPTION: Places a green line segment connecting (152, 160) to (102, 114).
; PLAN: r0=152(x1), r1=160(y1), r2=102(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 160
LDI r2, 102
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
