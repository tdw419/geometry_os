; DESCRIPTION: Places a green circle of radius 45 at center (273, 108).
; PLAN: r0=273(x), r1=108(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 108
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
