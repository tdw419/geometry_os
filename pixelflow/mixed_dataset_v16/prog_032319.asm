; DESCRIPTION: Places a yellow disk with center (127, 103) and radius 13.
; PLAN: r0=127(x), r1=103(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 103
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
