; DESCRIPTION: Places a black line segment connecting (46, 9) to (24, 237).
; PLAN: r0=46(x1), r1=9(y1), r2=24(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 9
LDI r2, 24
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
