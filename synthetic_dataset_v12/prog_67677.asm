; DESCRIPTION: Places a yellow circle of radius 21 at center (195, 198).
; PLAN: r0=195(x), r1=198(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 198
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
