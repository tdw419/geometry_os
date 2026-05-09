; DESCRIPTION: Places a yellow circle of radius 65 at center (107, 134).
; PLAN: r0=107(x), r1=134(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 134
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
