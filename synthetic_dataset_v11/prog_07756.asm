; DESCRIPTION: Places a green circle of radius 76 at center (149, 166).
; PLAN: r0=149(x), r1=166(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 166
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
