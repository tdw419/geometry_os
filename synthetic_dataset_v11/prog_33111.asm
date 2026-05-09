; DESCRIPTION: Places a green circle of radius 72 at center (182, 138).
; PLAN: r0=182(x), r1=138(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 138
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
