; DESCRIPTION: Composite: . Then Places a cyan dot at position (239, 205). Then Renders a white disk with center (84, 138) and radius 58.
; PLAN: r0=239(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=84(x), r1=138(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (239, 205).
; PLAN: r0=239(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 205
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (84, 138) and radius 58.
; PLAN: r0=84(x), r1=138(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 138
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
