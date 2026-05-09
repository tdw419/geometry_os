; DESCRIPTION: Places a black line segment connecting (279, 13) to (114, 178).
; PLAN: r0=279(x1), r1=13(y1), r2=114(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 13
LDI r2, 114
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
