; DESCRIPTION: Places a green circle of radius 12 at center (281, 72).
; PLAN: r0=281(x), r1=72(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 72
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
