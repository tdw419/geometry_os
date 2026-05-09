; DESCRIPTION: Places a yellow circle of radius 33 at center (166, 172).
; PLAN: r0=166(x), r1=172(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 172
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
