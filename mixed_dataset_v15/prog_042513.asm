; DESCRIPTION: Places a green circle of radius 65 at center (108, 71).
; PLAN: r0=108(x), r1=71(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 71
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
