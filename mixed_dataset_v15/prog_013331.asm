; DESCRIPTION: Places a black line segment connecting (58, 36) to (372, 28).
; PLAN: r0=58(x1), r1=36(y1), r2=372(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 36
LDI r2, 372
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
