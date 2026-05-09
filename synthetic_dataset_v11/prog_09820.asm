; DESCRIPTION: Composite: . Then Renders a blue box of size 18x108 starting at (8, 142). Then Sets a single magenta pixel at (107, 9).
; PLAN: r0=8(x), r1=142(y), r2=18(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=107(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 18x108 starting at (8, 142).
; PLAN: r0=8(x), r1=142(y), r2=18(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 142
LDI r2, 18
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (107, 9).
; PLAN: r0=107(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
