; DESCRIPTION: Composite: . Then Places a white dot at position (62, 47). Then Places a red circle of radius 41 at center (78, 44).
; PLAN: r0=62(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=78(x), r1=44(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (62, 47).
; PLAN: r0=62(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 41 at center (78, 44).
; PLAN: r0=78(x), r1=44(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 44
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
