; DESCRIPTION: Composite: . Then Renders a magenta disk with center (161, 123) and radius 74. Then Places a yellow dot at position (245, 139).
; PLAN: r0=161(x), r1=123(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=245(x), r1=139(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (161, 123) and radius 74.
; PLAN: r0=161(x), r1=123(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 123
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (245, 139).
; PLAN: r0=245(x), r1=139(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 139
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
