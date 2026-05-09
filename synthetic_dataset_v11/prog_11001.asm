; DESCRIPTION: Composite: . Then Places a yellow circle of radius 58 at center (196, 87). Then Places a blue dot at position (49, 213).
; PLAN: r0=196(x), r1=87(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 58 at center (196, 87).
; PLAN: r0=196(x), r1=87(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 87
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (49, 213).
; PLAN: r0=49(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 213
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
