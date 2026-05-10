; DESCRIPTION: Places a black line segment connecting (114, 241) to (159, 234).
; PLAN: r0=114(x1), r1=241(y1), r2=159(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 241
LDI r2, 159
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
