; DESCRIPTION: Places a yellow circle of radius 79 at center (86, 166).
; PLAN: r0=86(x), r1=166(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 166
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
