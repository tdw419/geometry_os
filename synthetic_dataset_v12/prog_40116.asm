; DESCRIPTION: Places a black line segment connecting (496, 19) to (82, 142).
; PLAN: r0=496(x1), r1=19(y1), r2=82(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 19
LDI r2, 82
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
