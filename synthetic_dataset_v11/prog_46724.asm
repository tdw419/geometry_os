; DESCRIPTION: Composite: . Then Renders a orange disk with center (105, 76) and radius 72. Then Places a magenta dot at position (142, 109).
; PLAN: r0=105(x), r1=76(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=142(x), r1=109(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (105, 76) and radius 72.
; PLAN: r0=105(x), r1=76(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 76
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (142, 109).
; PLAN: r0=142(x), r1=109(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 109
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
