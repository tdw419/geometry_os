; DESCRIPTION: Places a yellow line segment connecting (277, 78) to (372, 134).
; PLAN: r0=277(x1), r1=78(y1), r2=372(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 78
LDI r2, 372
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
