; DESCRIPTION: Composite: . Then Places a yellow dot at position (35, 147). Then Places a yellow circle of radius 54 at center (74, 189).
; PLAN: r0=35(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=74(x), r1=189(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (35, 147).
; PLAN: r0=35(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 147
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 54 at center (74, 189).
; PLAN: r0=74(x), r1=189(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 189
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
