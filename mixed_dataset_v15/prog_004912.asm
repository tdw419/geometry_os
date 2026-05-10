; DESCRIPTION: Places a yellow disk with center (291, 30) and radius 50.
; PLAN: r0=291(x), r1=30(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 30
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
