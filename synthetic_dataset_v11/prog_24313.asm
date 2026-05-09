; DESCRIPTION: Composite: . Then Renders a black box of size 93x18 starting at (3, 32). Then Places a blue dot at position (74, 163).
; PLAN: r0=3(x), r1=32(y), r2=93(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 93x18 starting at (3, 32).
; PLAN: r0=3(x), r1=32(y), r2=93(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 32
LDI r2, 93
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (74, 163).
; PLAN: r0=74(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
