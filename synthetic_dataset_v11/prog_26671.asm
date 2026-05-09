; DESCRIPTION: Composite: . Then Places a black 66x71 rectangle at position (138, 6). Then Places a blue dot at position (159, 16).
; PLAN: r0=138(x), r1=6(y), r2=66(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 66x71 rectangle at position (138, 6).
; PLAN: r0=138(x), r1=6(y), r2=66(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 6
LDI r2, 66
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (159, 16).
; PLAN: r0=159(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
