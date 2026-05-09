; DESCRIPTION: Composite: . Then Sets a single black pixel at (58, 202). Then Renders a yellow disk with center (88, 69) and radius 44.
; PLAN: r0=58(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=88(x), r1=69(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (58, 202).
; PLAN: r0=58(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 202
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (88, 69) and radius 44.
; PLAN: r0=88(x), r1=69(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 69
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
