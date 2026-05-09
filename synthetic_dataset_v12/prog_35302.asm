; DESCRIPTION: Places a yellow circle of radius 65 at center (443, 88).
; PLAN: r0=443(x), r1=88(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 88
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
