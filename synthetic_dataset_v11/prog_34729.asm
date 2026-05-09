; DESCRIPTION: Composite: . Then Places a magenta dot at position (152, 110). Then Renders a purple disk with center (156, 110) and radius 12.
; PLAN: r0=152(x), r1=110(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=110(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (152, 110).
; PLAN: r0=152(x), r1=110(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 110
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (156, 110) and radius 12.
; PLAN: r0=156(x), r1=110(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 110
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
