; DESCRIPTION: Places a yellow line segment connecting (172, 4) to (170, 134).
; PLAN: r0=172(x1), r1=4(y1), r2=170(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 4
LDI r2, 170
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
