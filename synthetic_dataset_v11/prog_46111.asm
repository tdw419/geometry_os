; DESCRIPTION: Composite: . Then Sets a single green pixel at (160, 48). Then Places a red circle of radius 14 at center (81, 88).
; PLAN: r0=160(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=88(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (160, 48).
; PLAN: r0=160(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 14 at center (81, 88).
; PLAN: r0=81(x), r1=88(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 88
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
