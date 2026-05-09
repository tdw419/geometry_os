; DESCRIPTION: Composite: . Then Sets a single blue pixel at (56, 23). Then Renders a green box of size 62x105 starting at (18, 93).
; PLAN: r0=56(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=18(x), r1=93(y), r2=62(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (56, 23).
; PLAN: r0=56(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 23
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 62x105 starting at (18, 93).
; PLAN: r0=18(x), r1=93(y), r2=62(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 93
LDI r2, 62
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
