; DESCRIPTION: Places a yellow line segment connecting (114, 237) to (41, 32).
; PLAN: r0=114(x1), r1=237(y1), r2=41(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 237
LDI r2, 41
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
