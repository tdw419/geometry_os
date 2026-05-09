; DESCRIPTION: Composite: . Then Renders a blue disk with center (166, 129) and radius 60. Then Places a red dot at position (139, 83).
; PLAN: r0=166(x), r1=129(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=139(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (166, 129) and radius 60.
; PLAN: r0=166(x), r1=129(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 129
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (139, 83).
; PLAN: r0=139(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
