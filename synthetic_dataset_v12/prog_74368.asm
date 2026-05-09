; DESCRIPTION: Places a yellow line segment connecting (430, 103) to (291, 138).
; PLAN: r0=430(x1), r1=103(y1), r2=291(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 103
LDI r2, 291
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
