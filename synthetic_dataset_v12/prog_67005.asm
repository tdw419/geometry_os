; DESCRIPTION: Places a green line segment connecting (315, 78) to (488, 19).
; PLAN: r0=315(x1), r1=78(y1), r2=488(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 78
LDI r2, 488
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
