; DESCRIPTION: Composite: . Then Renders a black box of size 93x51 starting at (104, 44). Then Places a blue dot at position (23, 21).
; PLAN: r0=104(x), r1=44(y), r2=93(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=23(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 93x51 starting at (104, 44).
; PLAN: r0=104(x), r1=44(y), r2=93(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 44
LDI r2, 93
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (23, 21).
; PLAN: r0=23(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
