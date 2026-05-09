; DESCRIPTION: Places a yellow circle of radius 40 at center (188, 166).
; PLAN: r0=188(x), r1=166(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 166
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
