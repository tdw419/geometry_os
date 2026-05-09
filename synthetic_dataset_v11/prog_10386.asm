; DESCRIPTION: Places a purple line segment connecting (33, 214) to (41, 83).
; PLAN: r0=33(x1), r1=214(y1), r2=41(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 214
LDI r2, 41
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
