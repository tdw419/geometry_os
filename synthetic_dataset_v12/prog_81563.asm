; DESCRIPTION: Places a black line segment connecting (38, 114) to (330, 90).
; PLAN: r0=38(x1), r1=114(y1), r2=330(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 114
LDI r2, 330
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
