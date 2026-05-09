; DESCRIPTION: Places a yellow circle of radius 10 at center (340, 160).
; PLAN: r0=340(x), r1=160(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 160
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
