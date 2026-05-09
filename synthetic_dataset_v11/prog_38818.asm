; DESCRIPTION: Places a yellow line segment connecting (26, 233) to (152, 114).
; PLAN: r0=26(x1), r1=233(y1), r2=152(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 233
LDI r2, 152
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
