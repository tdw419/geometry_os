; DESCRIPTION: Places a green circle of radius 26 at center (480, 62).
; PLAN: r0=480(x), r1=62(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 62
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
