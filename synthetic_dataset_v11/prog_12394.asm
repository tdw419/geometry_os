; DESCRIPTION: Composite: . Then Renders a white disk with center (141, 157) and radius 59. Then Places a white dot at position (161, 221).
; PLAN: r0=141(x), r1=157(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=161(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (141, 157) and radius 59.
; PLAN: r0=141(x), r1=157(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 157
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (161, 221).
; PLAN: r0=161(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 221
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
