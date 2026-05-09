; DESCRIPTION: Places a yellow circle of radius 45 at center (366, 206).
; PLAN: r0=366(x), r1=206(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 206
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
