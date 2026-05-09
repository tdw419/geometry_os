; DESCRIPTION: Composite: . Then Places a orange dot at position (75, 217). Then Places a green circle of radius 71 at center (168, 172).
; PLAN: r0=75(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=168(x), r1=172(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (75, 217).
; PLAN: r0=75(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 71 at center (168, 172).
; PLAN: r0=168(x), r1=172(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 172
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
