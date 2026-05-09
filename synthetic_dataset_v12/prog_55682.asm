; DESCRIPTION: Places a black line segment connecting (47, 48) to (333, 195).
; PLAN: r0=47(x1), r1=48(y1), r2=333(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 48
LDI r2, 333
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
