; DESCRIPTION: Composite: . Then Sets a single black pixel at (160, 68). Then Places a yellow circle of radius 80 at center (121, 100).
; PLAN: r0=160(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=100(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (160, 68).
; PLAN: r0=160(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 80 at center (121, 100).
; PLAN: r0=121(x), r1=100(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 100
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
