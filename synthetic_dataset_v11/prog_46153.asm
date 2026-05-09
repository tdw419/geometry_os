; DESCRIPTION: Composite: . Then Renders a red disk with center (160, 103) and radius 67. Then Sets a single magenta pixel at (193, 40).
; PLAN: r0=160(x), r1=103(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=193(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (160, 103) and radius 67.
; PLAN: r0=160(x), r1=103(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 103
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (193, 40).
; PLAN: r0=193(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
