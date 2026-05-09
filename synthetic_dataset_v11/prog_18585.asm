; DESCRIPTION: Places a black line segment connecting (210, 101) to (68, 132).
; PLAN: r0=210(x1), r1=101(y1), r2=68(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 101
LDI r2, 68
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
