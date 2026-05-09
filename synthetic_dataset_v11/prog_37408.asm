; DESCRIPTION: Composite: . Then Renders a orange disk with center (111, 168) and radius 47. Then Places a white dot at position (2, 190).
; PLAN: r0=111(x), r1=168(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=2(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (111, 168) and radius 47.
; PLAN: r0=111(x), r1=168(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 168
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (2, 190).
; PLAN: r0=2(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 190
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
