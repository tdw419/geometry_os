; DESCRIPTION: Composite: . Then Places a blue dot at position (65, 55). Then Places a magenta circle of radius 67 at center (117, 97).
; PLAN: r0=65(x), r1=55(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=117(x), r1=97(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (65, 55).
; PLAN: r0=65(x), r1=55(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 55
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 67 at center (117, 97).
; PLAN: r0=117(x), r1=97(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 97
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
