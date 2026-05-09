; DESCRIPTION: Composite: . Then Places a orange dot at position (2, 64). Then Places a yellow circle of radius 41 at center (74, 67).
; PLAN: r0=2(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=74(x), r1=67(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (2, 64).
; PLAN: r0=2(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 41 at center (74, 67).
; PLAN: r0=74(x), r1=67(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 67
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
