; DESCRIPTION: Places a black line segment connecting (113, 66) to (58, 19).
; PLAN: r0=113(x1), r1=66(y1), r2=58(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 66
LDI r2, 58
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
