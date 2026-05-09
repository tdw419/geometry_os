; DESCRIPTION: Composite: . Then Places a white dot at position (108, 88). Then Places a orange circle of radius 12 at center (163, 68).
; PLAN: r0=108(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=163(x), r1=68(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (108, 88).
; PLAN: r0=108(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 12 at center (163, 68).
; PLAN: r0=163(x), r1=68(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 68
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
