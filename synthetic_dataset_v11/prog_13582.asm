; DESCRIPTION: Places a green circle of radius 44 at center (156, 65).
; PLAN: r0=156(x), r1=65(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 65
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
