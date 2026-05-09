; DESCRIPTION: Composite: . Then Places a red dot at position (64, 247). Then Renders a orange disk with center (166, 181) and radius 28.
; PLAN: r0=64(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=166(x), r1=181(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (64, 247).
; PLAN: r0=64(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (166, 181) and radius 28.
; PLAN: r0=166(x), r1=181(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 181
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
