; DESCRIPTION: Composite: . Then Draws a purple circle centered at (141, 55) with radius 36. Then Sets a single black pixel at (130, 223).
; PLAN: r0=141(x), r1=55(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=130(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (141, 55) with radius 36.
; PLAN: r0=141(x), r1=55(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 55
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (130, 223).
; PLAN: r0=130(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 223
LDI r2, 0x000000
PSET r0, r1, r2
HALT
