; DESCRIPTION: Places a black circle of radius 65 at center (151, 135).
; PLAN: r0=151(x), r1=135(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 135
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
