; DESCRIPTION: Composite: . Then Renders a blue disk with center (152, 184) and radius 65. Then Places a yellow dot at position (134, 168).
; PLAN: r0=152(x), r1=184(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=134(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (152, 184) and radius 65.
; PLAN: r0=152(x), r1=184(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 184
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (134, 168).
; PLAN: r0=134(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
