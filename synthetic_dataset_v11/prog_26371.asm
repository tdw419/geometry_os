; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (172, 131). Then Renders a white box of size 76x71 starting at (84, 8).
; PLAN: r0=172(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=84(x), r1=8(y), r2=76(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (172, 131).
; PLAN: r0=172(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 76x71 starting at (84, 8).
; PLAN: r0=84(x), r1=8(y), r2=76(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 8
LDI r2, 76
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
