; DESCRIPTION: Composite: . Then Sets a single purple pixel at (11, 131). Then Renders a white box of size 62x51 starting at (127, 174).
; PLAN: r0=11(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=127(x), r1=174(y), r2=62(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (11, 131).
; PLAN: r0=11(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 62x51 starting at (127, 174).
; PLAN: r0=127(x), r1=174(y), r2=62(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 174
LDI r2, 62
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
