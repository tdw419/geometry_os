; DESCRIPTION: Composite: . Then Places a magenta circle of radius 45 at center (74, 67). Then Places a orange dot at position (128, 210).
; PLAN: r0=74(x), r1=67(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 45 at center (74, 67).
; PLAN: r0=74(x), r1=67(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 67
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (128, 210).
; PLAN: r0=128(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 210
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
