; DESCRIPTION: Places a magenta circle of radius 26 at center (149, 65).
; PLAN: r0=149(x), r1=65(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 65
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
