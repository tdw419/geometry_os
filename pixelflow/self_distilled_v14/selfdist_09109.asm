; DESCRIPTION: Places a yellow disk with center (278, 75) and radius 27.
; PLAN: r0=278(x), r1=75(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 75
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
