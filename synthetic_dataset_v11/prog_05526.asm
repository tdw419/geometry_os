; DESCRIPTION: Places a purple line segment connecting (69, 230) to (41, 225).
; PLAN: r0=69(x1), r1=230(y1), r2=41(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 230
LDI r2, 41
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
