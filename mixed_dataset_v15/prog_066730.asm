; DESCRIPTION: Places a black line segment connecting (468, 238) to (481, 38).
; PLAN: r0=468(x1), r1=238(y1), r2=481(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 238
LDI r2, 481
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
