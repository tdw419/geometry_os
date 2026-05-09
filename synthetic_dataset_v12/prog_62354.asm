; DESCRIPTION: Places a black line segment connecting (91, 138) to (428, 115).
; PLAN: r0=91(x1), r1=138(y1), r2=428(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 138
LDI r2, 428
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
