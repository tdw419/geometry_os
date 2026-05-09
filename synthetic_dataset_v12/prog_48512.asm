; DESCRIPTION: Places a yellow line segment connecting (6, 141) to (122, 132).
; PLAN: r0=6(x1), r1=141(y1), r2=122(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 141
LDI r2, 122
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
