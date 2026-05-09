; DESCRIPTION: Places a black line segment connecting (227, 133) to (215, 47).
; PLAN: r0=227(x1), r1=133(y1), r2=215(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 133
LDI r2, 215
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
