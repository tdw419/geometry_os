; DESCRIPTION: Places a green disk with center (60, 55) and radius 23.
; PLAN: r0=60(x), r1=55(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 55
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
