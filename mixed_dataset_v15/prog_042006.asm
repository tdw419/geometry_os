; DESCRIPTION: Places a black line segment connecting (161, 73) to (30, 24).
; PLAN: r0=161(x1), r1=73(y1), r2=30(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 73
LDI r2, 30
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
