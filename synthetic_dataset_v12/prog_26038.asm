; DESCRIPTION: Places a yellow circle of radius 10 at center (271, 196).
; PLAN: r0=271(x), r1=196(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 196
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
