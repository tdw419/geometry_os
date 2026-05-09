; DESCRIPTION: Composite: . Then Places a orange circle of radius 67 at center (154, 180). Then Places a purple dot at position (196, 175).
; PLAN: r0=154(x), r1=180(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x), r1=175(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 67 at center (154, 180).
; PLAN: r0=154(x), r1=180(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 180
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (196, 175).
; PLAN: r0=196(x), r1=175(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 175
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
