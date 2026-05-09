; DESCRIPTION: Places a yellow circle of radius 33 at center (48, 127).
; PLAN: r0=48(x), r1=127(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 127
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
