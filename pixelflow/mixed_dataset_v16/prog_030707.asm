; DESCRIPTION: Places a black line segment connecting (162, 134) to (245, 76).
; PLAN: r0=162(x1), r1=134(y1), r2=245(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 134
LDI r2, 245
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
