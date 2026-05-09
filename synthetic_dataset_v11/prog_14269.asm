; DESCRIPTION: Places a black line segment connecting (208, 208) to (38, 1).
; PLAN: r0=208(x1), r1=208(y1), r2=38(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 208
LDI r2, 38
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
