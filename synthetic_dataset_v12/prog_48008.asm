; DESCRIPTION: Places a black line segment connecting (441, 154) to (386, 11).
; PLAN: r0=441(x1), r1=154(y1), r2=386(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 154
LDI r2, 386
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
