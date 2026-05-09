; DESCRIPTION: Places a black line segment connecting (488, 6) to (47, 118).
; PLAN: r0=488(x1), r1=6(y1), r2=47(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 6
LDI r2, 47
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
