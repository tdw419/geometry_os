; DESCRIPTION: Composite: . Then Renders a white disk with center (178, 93) and radius 68. Then Places a yellow dot at position (81, 46).
; PLAN: r0=178(x), r1=93(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=81(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (178, 93) and radius 68.
; PLAN: r0=178(x), r1=93(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 93
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (81, 46).
; PLAN: r0=81(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
