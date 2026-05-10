; DESCRIPTION: Places a yellow circle of radius 69 at center (291, 150).
; PLAN: r0=291(x), r1=150(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 150
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
